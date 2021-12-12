//
//  AuthorizationDataService.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import Moya
import RxSwift
import Domain

class AuthorizationDataService {
    
    fileprivate let provider = MoyaProvider<AuthorizationService>(endpointClosure: { (target: AuthorizationService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type" : "application/json"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func requestLogin() -> Observable<LoginModel> {
        return Observable<LoginModel>.create { observer in
            self.provider.request(.login) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let loginData = try decoder.decode(LoginModel.self, from: response.data)
                    // login data return
                    let loginModel = LoginModel(user_id: 1, consumer_key: "", consumer_secret: "")
                    observer.onNext(loginModel)
                    
                    observer.onCompleted()
                    print("success",loginData)
                } catch (let error) {
                    observer.onError(error)
                }
            case .failure(let error):
                observer.onError(error)
            }
        }
            return Disposables.create()
        }
    }
    
}

