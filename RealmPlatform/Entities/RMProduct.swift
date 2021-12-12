import QueryKit
import Domain
import RealmSwift
import Realm

final class RMProduct: Object {
    
    @objc dynamic var uid: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var date_created: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var udescription: String = ""
    @objc dynamic var short_description: String = ""
    @objc dynamic var price: String = "0.0"
    let images = List<RMProductImages>()

    override class func primaryKey() -> String? {
        return "uid"
    }
}

extension RMProduct {
    static var uid: Attribute<Int> { return Attribute("id")}
    static var name: Attribute<String> { return Attribute("name")}
    static var date_created: Attribute<String> { return Attribute("date_created")}
    static var type: Attribute<String> { return Attribute("type")}
    static var status: Attribute<String> { return Attribute("status")}
    static var udescription: Attribute<String> { return Attribute("description")}
    static var short_description: Attribute<String> { return Attribute("short_description")}
    static var price: Attribute<Double> { return Attribute("price")}
    static var images: Attribute<String> { return Attribute("images")}
}

extension RMProduct: DomainConvertibleType {
    func asDomain() -> Product {
        return Product(id: uid, name: name, date_created: date_created, type: type, status: status, description: udescription, short_description: short_description, price: price, images: images.mapToDomain())
    }
}

extension Product: RealmRepresentable {
    var uid: Int {
        0
    }
    
    func asRealm() -> RMProduct {
        return RMProduct.build { object in
            object.uid = uid
            object.name = name ?? ""
            object.date_created = date_created ?? ""
            object.type = type ?? ""
            object.status = status ?? ""
            object.udescription = description ?? ""
            object.short_description = short_description ?? ""
            object.price = price ?? "0.0"
        }
    }
}
