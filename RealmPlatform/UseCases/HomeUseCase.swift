import Foundation
import Domain
import RxSwift
import Realm
import RealmSwift

final class HomeUseCase<Repository>: Domain.HomeUseCase where Repository: AbstractRepository, Repository.T == Product {
    
    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func fetchProducts() -> Observable<[Product]> {
        return repository.queryAll()
    }
}
