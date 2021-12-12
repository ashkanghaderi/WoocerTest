//
//  HomeUseCase.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import RxSwift

public protocol HomeUseCase {
    func fetchProducts() -> Observable<[Product]>
}
