//
//  ProductImages.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation

public struct ProductImages : Codable {
    
    public var id: Int?
    public var src: String?
    public var name: String?
    public var alt: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id    = "id"
        case src   = "src"
        case name  = "name"
        case alt   = "alt"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        src = try? values.decodeIfPresent(String.self, forKey: .src)
        alt = try? values.decodeIfPresent(String.self, forKey: .alt)
        
    }
    
    public init(id: Int, src: String, name: String, alt: String) {
        self.id = id
        self.src = src
        self.name = name
        self.alt = alt
    }
    
}
