//
//  RegisterationModel.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation

public struct LoginModel: Codable {
    
    public var key_id: Int?
    public var user_id: Int?
    public var consumer_key: String?
    public var consumer_secret: String?
    public var key_permissions: String?
    
    public init(user_id: Int, consumer_key: String, consumer_secret: String) {
        self.user_id = user_id
        self.consumer_key = consumer_key
        self.consumer_secret = consumer_secret
    }
    
}
