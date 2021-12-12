//
//  RMLogin.swift
//  RealmPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import QueryKit
import Domain
import RealmSwift
import Realm

final class RMLogin: Object {
    
    @objc dynamic var key_id = 0
    @objc dynamic var user_id = 0
    @objc dynamic var consumer_key: String = ""
    @objc dynamic var consumer_secret: String = ""
    @objc dynamic var key_permissions: String = ""
}

extension RMLogin {
    static var key_id: Attribute<Int> { return Attribute("key_id")}
    static var user_id: Attribute<Int> { return Attribute("user_id")}
    static var consumer_key: Attribute<String> { return Attribute("consumer_key")}
    static var consumer_secret: Attribute<String> { return Attribute("consumer_secret")}
    static var key_permissions: Attribute<String> { return Attribute("key_permissions")}
}

extension RMLogin: DomainConvertibleType {
    func asDomain() -> LoginModel {
        return LoginModel(user_id: user_id, consumer_key: consumer_key, consumer_secret: consumer_secret)
    }
}

extension LoginModel: RealmRepresentable {
    var uid: Int {
        0
    }

    func asRealm() -> RMLogin {
        return RMLogin.build { object in
            object.user_id = user_id ?? 0
            object.consumer_key = consumer_key ?? ""
            object.consumer_secret = consumer_secret ?? ""
        }
    }
}


