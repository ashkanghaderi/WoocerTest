//
//  Product.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation

public struct Product : Codable{
    
    public var id: Int?
    public var name: String?
    public var date_created: String?
    public var type: String?
    public var status: String?
    public var description: String?
    public var short_description: String?
    public var price: String?
    public var images: [ProductImages]?
    
    enum CodingKeys: String, CodingKey {

        case id                  = "id"
        case name                = "name"
        case date_created        = "date_created"
        case type                = "type"
        case status              = "status"
        case description         = "description"
        case short_description   = "short_description"
        case price               = "price"
        case images              = "images"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        date_created = try? values.decodeIfPresent(String.self, forKey: .date_created)
        type = try? values.decodeIfPresent(String.self, forKey: .type)
        status = try? values.decodeIfPresent(String.self, forKey: .status)
        description = try? values.decodeIfPresent(String.self, forKey: .description)
        short_description = try? values.decodeIfPresent(String.self, forKey: .short_description)
        short_description = try? values.decodeIfPresent(String.self, forKey: .short_description)
        price = try? values.decodeIfPresent(String.self, forKey: .price)
        images = try? values.decodeIfPresent([ProductImages].self, forKey: .images)

    }
    
    public init(id: Int,name: String, date_created: String, type: String, status: String, description: String, short_description: String, price: String, images: [ProductImages]) {
        self.id = id
        self.name = name
        self.date_created = date_created
        self.status = status
        self.description = description
        self.short_description = short_description
        self.price = price
        self.images = images
    }
    
}
