import Foundation
import Domain
import Realm
import RealmSwift

public final class UseCaseProvider: Domain.UseCaseProvider {
   
    private let configuration: Realm.Configuration

    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    public func makeHomeUseCase() -> Domain.HomeUseCase {
        let repository = Repository<Product>(configuration: configuration)
        return HomeUseCase(repository: repository)
    }
    
    public func makeAuthenticationUseCase() -> Domain.AuthenticationUseCase {
        let repository = Repository<LoginModel>(configuration: configuration)
        return AuthenticationUseCase(repository: repository)
    }
}
