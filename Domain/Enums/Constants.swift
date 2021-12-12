//
//  Constants.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

public enum BaseURL: String {
    
    case dev = "https://wpt.woocer.com"
    
}

// MARK: - ServiceRouter Definition

public enum ServiceRouter {
    
    case AuthServiceRoute(AuthRoute)
    case HomeServiceRoute(HomeRoute)
}

extension ServiceRouter {
    public var url: String {
        switch self {
        case .AuthServiceRoute(let authRoute):
            return authRoute.path
            
        case .HomeServiceRoute(let exhRoute):
            return exhRoute.path
        
        }
 
    }
}

// MARK: - AuthRoute

public enum AuthRoute: String {
    
    case login = "/authorize"

    var path: String {
        return "/wc-auth/" + AppSetting.AUTH_API_VERSION + rawValue
    }
}

// MARK: - HomeRoute

public enum HomeRoute: String {
    
    case products = "/products"
    
    var path: String {
        return "/wp-json/wc/" + AppSetting.API_VERSION + rawValue
    }
}

