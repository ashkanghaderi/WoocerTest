//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider
{
    
    public init() {}
    
    public func makeHomeUseCase() -> Domain.HomeUseCase {
        return HomeUseCase()
    }
    
    public func makeAuthenticationUseCase() -> Domain.AuthenticationUseCase {
        return AuthenticationUseCase()
    }
    
}

