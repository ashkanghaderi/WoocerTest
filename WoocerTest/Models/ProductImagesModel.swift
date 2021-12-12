//
//  ProductImagesModel.swift
//  WoocerTest
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation
import Domain

public struct ProductImagesModel {
    
    public var id: Int?
    public var src: String?
    public var name: String?
    public var alt: String?
    
    public init(_ productImage : ProductImages) {
        self.id = productImage.id
        self.src = productImage.src
        self.name = productImage.name
        self.alt = productImage.alt
    }

}
