//
//  SetPhoneUseCase.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Domain
import RxSwift

public final class AuthenticationUseCase: Domain.AuthenticationUseCase {
    
    @LazyInjected private var service: AuthorizationDataService
    
    public init(){}
   
    public func login() -> Observable<LoginModel> {
        return service.requestLogin()
    }
}
