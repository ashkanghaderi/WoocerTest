//
//  ProductsModel.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import Domain

public struct ProductModel {
    
    public var id: Int?
    public var name: String?
    public var date_created: String?
    public var type: String?
    public var status: String?
    public var description: String?
    public var short_description: String?
    public var price: String?
    public var images: [ProductImagesModel]?
    
    public init(_ product: Domain.Product) {
        self.id = product.id
        self.name = product.name
        self.date_created = product.date_created
        self.status = product.status
        self.description = product.description
        self.short_description = product.short_description
        self.price = product.price
        self.images = product.images!.map {(image) -> ProductImagesModel in
            return ProductImagesModel(image)
        }
    }
    
}
