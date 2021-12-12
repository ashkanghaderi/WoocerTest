//
//  AuthenticationUseCase.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import RxSwift

public protocol AuthenticationUseCase {
    
    func login() -> Observable<LoginModel>
    
}
