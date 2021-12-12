//
//  EncodableExtension.swift
//  NetworkPlatform
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}


