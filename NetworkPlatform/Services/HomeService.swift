//
//  HomeCardsServices.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import RxSwift
import Domain
import Moya
import Alamofire

public enum HomeService {
    
    case fetchProducts

}

extension HomeService: TargetType {
    
    public var baseURL: URL {
        let baseUrl = BaseURL.dev.rawValue
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .fetchProducts:
            return ServiceRouter.HomeServiceRoute(.products).url
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchProducts:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
            case .fetchProducts:
            return .requestParameters(parameters: ["consumer_key":"ck_85f212310cfff32728cc4c933331aa6bcf3002ef", "consumer_secret":"cs_ee784168289012a919a008985d2252fadecea2bb"], encoding: URLEncoding.queryString)
            }
    }
    
    public var headers: [String : String]? {
        return nil
//        let credentials = (key: "ck_85f212310cfff32728cc4c933331aa6bcf3002ef", secret: "cs_ee784168289012a919a008985d2252fadecea2bb")
//        let sig = OAuthHeaderProvider.calculateSignature(url: self.baseURL,
//                                                         method: self.method.rawValue,
//                                                         parameter: [:], consumerCredentials: credentials, userCredentials: nil)
//        return ["Authorization":sig]
    }
    
}

