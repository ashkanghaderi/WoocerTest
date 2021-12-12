//
//  HomeNavigator.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import Domain
import NetworkPlatform
import UIKit

class HomeNavigator {
    
    private let navigationController: UINavigationController
    private let services: Domain.UseCaseProvider
    
    init(services: Domain.UseCaseProvider, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func setup() {
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeVC.viewModel = HomeViewModel(navigator: self, useCase: services.makeHomeUseCase())
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func toErrorPage(error: Error) {
        
    }
    
    func toProfile() {
       
    }
}
