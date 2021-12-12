//
//  RMProductImages.swift
//  RealmPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import QueryKit
import Domain
import RealmSwift
import Realm

final class RMProductImages: Object {
    
    @objc dynamic var uid: Int = 0
    @objc dynamic var src: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var alt: String = ""
    let pImages = LinkingObjects(fromType: RMProduct.self, property: "images")
    
    override class func primaryKey() -> String? {
        return "uid"
    }
}

extension RMProductImages {
    static var uid: Attribute<Int> { return Attribute("id")}
    static var src: Attribute<String> { return Attribute("src")}
    static var name: Attribute<String> { return Attribute("name")}
    static var alt: Attribute<String> { return Attribute("alt")}
}

extension RMProductImages: DomainConvertibleType {
    func asDomain() -> ProductImages {
        return ProductImages(id: uid,
                             src: src,
                             name: name,
                             alt: alt)
    }
}

extension ProductImages: RealmRepresentable {
    var uid: Int {
        0
    }

    func asRealm() -> RMProductImages {
        return RMProductImages.build { object in
            object.uid = id ?? 0
            object.src = src ?? ""
            object.name = name ?? ""
            object.alt = alt ?? ""
        }
    }
}

