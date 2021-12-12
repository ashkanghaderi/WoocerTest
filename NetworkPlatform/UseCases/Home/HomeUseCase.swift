
import Foundation
import Domain
import RxSwift

public final class HomeUseCase: Domain.HomeUseCase {
   
    @LazyInjected private var service: HomeDataService
    
    public init(){}
    
    public func fetchProducts() -> Observable<[Product]> {
       return service.requestFetchProducts()
    }
    
}
