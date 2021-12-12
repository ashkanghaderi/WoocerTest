//
//  LoginViewModel.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import Domain
import RxCocoa
import RxSwift
import NetworkPlatform

final class LoginViewModel: ViewModelType {
    
    private let navigator: LoginNavigator
    private let useCase: Domain.AuthenticationUseCase
    
    init( navigator: LoginNavigator, useCase: Domain.AuthenticationUseCase) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        var _ : Driver<Error>?
        
        
        _ = Driver.combineLatest(input.email, input.password)
        
        let canLogin = Driver.combineLatest(input.email, input.password){ (email, pass) in
            return !email.isEmpty && !pass.isEmpty
        }
        
        let emailCorrect = input.email.map { (email) -> String in
            if email != "" {
                if !email.isValidEmail(){
                    return "Invalid Email"
                }
            }
            return  ""
        }
        
        let  canReset = Driver.combineLatest(input.email, emailCorrect){ (email, emailError) in
            return !email.isEmpty && emailError == ""
        }
        
//        let login = input.loginTrigger.flatMapLatest { [unowned self] in
//            return self.useCase.login()
//                .trackActivity(activityIndicator).trackError(errorTracker).do(onNext: { [unowned self](respose) in
//                    /// save login info here
//                    self.navigator.toHome()
//
//                    },onError: {(error) in
//                            print(error)
//                    })
//                .asDriverOnErrorJustComplete().mapToVoid()
//        }
        
        let login = input.loginTrigger.do(onNext: { [unowned self]() in
            self.navigator.toHome()
        }).mapToVoid()
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        
        return Output(loginAction: login, canLogin: canLogin, canReset: canReset,emailError: emailCorrect, error: errors, isFetching: fetching)
    }
    
}

extension LoginViewModel {
    struct Input {
        
        let loginTrigger: Driver<Void>
        let forgotPassTrigger: Driver<Void>
        let email: Driver<String>
        let password: Driver<String>
    }
    
    struct Output {
        let loginAction: Driver<Void>
        let canLogin: Driver<Bool>
        let canReset: Driver<Bool>
        let emailError: Driver<String>
        let error: Driver<Error>
        let isFetching: Driver<Bool>
        
    }
    
}

