import Foundation
import Domain
import RxSwift
import Realm
import RealmSwift

final class AuthenticationUseCase<Repository>: Domain.AuthenticationUseCase where Repository: AbstractRepository, Repository.T == LoginModel {
    
    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }
    
    func login() -> Observable<LoginModel> {
        return Observable<LoginModel>.create { observer in
            observer.onNext(LoginModel(user_id: 0, consumer_key: "", consumer_secret: ""))
            return Disposables.create()
        }
    }
    
}

