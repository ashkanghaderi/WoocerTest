//
//  Result.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-10.
//

import Foundation

public enum Result<T> {
    case success(value: T)
    case failure(error: Error)
}
