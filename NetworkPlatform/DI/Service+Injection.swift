
import Foundation
import Resolver
import Domain

extension Resolver{
    
    public static func  ServiceInjection(){
        register(AuthorizationDataService.self)          {AuthorizationDataService()}
        register(HomeDataService.self)                   {HomeDataService()}
    }
    
}

