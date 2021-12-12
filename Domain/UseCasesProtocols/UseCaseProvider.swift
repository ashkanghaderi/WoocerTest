//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation

public protocol UseCaseProvider {
    func makeHomeUseCase() -> HomeUseCase
    func makeAuthenticationUseCase() -> AuthenticationUseCase
}
