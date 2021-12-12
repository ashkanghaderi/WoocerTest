//
//  LoginNavigator.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import Domain
import UIKit

class LoginNavigator {
    
    private let navigationController: UINavigationController
    private let services: Domain.UseCaseProvider
    
    init(navigationController: UINavigationController, services: UseCaseProvider) {
        self.navigationController = navigationController
        self.services = services
    }
    
    func setup() {
        let LoginVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
        LoginVC.viewModel = LoginViewModel(navigator: self, useCase: services.makeAuthenticationUseCase())
        navigationController.viewControllers = [LoginVC]
    }
    
    func toHome(){
        
        HomeNavigator(services: services, navigationController: navigationController).setup()
    }
    
    func toErrorPage(error: Error) {
        
    }
}
