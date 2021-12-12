//
//  HomeViewModel.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import Domain
import NetworkPlatform
import RxCocoa
import RxSwift

final class HomeViewModel: ViewModelType {
    
    public let navigator: HomeNavigator
    private let useCase: Domain.HomeUseCase
    
    init( navigator: HomeNavigator, useCase: Domain.HomeUseCase) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        
        let userName = Driver.just("Alex")
        let imageUrl = Driver.just("https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50")
        
        let products = input.viewWillAppearTrigger.flatMapLatest {
            return self.useCase.fetchProducts()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map { $0.map { ProductModel($0) } }
        }
        
        let profileAction = input.profileTrigger.do(onNext: { _ in 
            self.navigator.toProfile()
        }).mapToVoid()
        
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        
        return Output(profileAction: profileAction, products: products, userName: userName,  imageUrl: imageUrl, error: errors, isFetching: fetching)
    }
}

extension HomeViewModel {
    struct Input {

        let viewWillAppearTrigger: Driver<Void>
        let profileTrigger: Driver<Void>
        
    }
    
    struct Output {
        
        let profileAction: Driver<Void>
        let products: Driver<[ProductModel]>
        let userName: Driver<String>
        let imageUrl: Driver<String>
        let error: Driver<Error>
        let isFetching: Driver<Bool>
        
    }
    
}

