//
//  AuthorizationService.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import RxSwift
import Domain
import Moya

public enum AuthorizationService{
    
    case login

}

extension AuthorizationService: TargetType {
    
    public var baseURL: URL {
        let baseUrl = BaseURL.dev.rawValue
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .login:
            return ServiceRouter.AuthServiceRoute(.login).url
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
}

