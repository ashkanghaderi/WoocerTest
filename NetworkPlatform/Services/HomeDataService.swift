//
//  HomeDataService.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import Moya
import RxSwift
import Domain

class HomeDataService {
    
    fileprivate let provider = MoyaProvider<HomeService>(endpointClosure: { (target: HomeService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            
            let httpHeaderFields = ["Content-Type" : "application/json"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    },plugins: [VerbosePlugin(verbose: true)])
    
    func requestFetchProducts() -> Observable<[Product]> {
        return Observable<[Product]>.create { observer in
            self.provider.request(.fetchProducts) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    if let theJson = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) {
                        print(theJson)
                    } else {
                        let response = String(data: response.data, encoding: .utf8)!
                        print(response)
                    }
                    
                    let products = try decoder.decode([Product].self, from: response.data)
                    observer.onNext(products)
                    observer.onCompleted()
                    print("success",products)
                } catch (let error) {
                    observer.onError(error)
                }
            case .failure(let error):
                self.handleMoyaError(error)
                observer.onError(error)
            }
        }
            return Disposables.create()
        }
    }
    
    private func handleMoyaError(_ moyaError : MoyaError){

        switch moyaError {
        case let .statusCode(response):
            print(response.request?.url)
        case  .underlying(let nsError as NSError, let response): break
            // nsError  have URL  timeOut , no connection and cancel request
            //  just use response to map  of there is error
        default: break

        }
    }
    
}

struct VerbosePlugin: PluginType {
    let verbose: Bool

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        if let body = request.httpBody,
           let str = String(data: body, encoding: .utf8) {
            if verbose {
                print("request to send: \(str))")
            }
        }
       
        return request
    }

    func didReceive(_ result: Result<Response>, target: TargetType) {
        
        switch result {
        case .success(let body):
            if verbose {
                print("Response:")
                if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                    print(json)
                } else {
                    let response = String(data: body.data, encoding: .utf8)!
                    print(response)
                }
            }
        case .failure( _):
            break
        }
        
    }

}

