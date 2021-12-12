

import Foundation
import NetworkPlatform
import Domain
import UIKit

final class Application {
    static let shared = Application()
    
    private let networkUseCaseProvider: Domain.UseCaseProvider
    private init() {
        
        self.networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
    }
    
    func configureMainInterface(_ window: UIWindow){
        let mainNavigationController = MainNavigationController()
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
        
        LoginNavigator(navigationController: mainNavigationController, services: networkUseCaseProvider).setup()
        
    }
}
