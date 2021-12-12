//
//  Extensions.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation
import SwiftyJSON

public protocol BaseRequestModel: Encodable {

}

public extension BaseRequestModel {
    var dateEncodeStrategy : JSONEncoder.DateEncodingStrategy {
        return .millisecondsSince1970
    }
    func encoder() -> JSON {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = self.dateEncodeStrategy

            let data = try encoder.encode(self)
            let json = try JSON(data: data)
            return json
        }catch {
            return JSON()
        }
    }
}


