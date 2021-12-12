//
//  ErrorTypes.swift
//  Domain
//
//  Created by Ashkan Ghaderi on 2021-12-11.
//

import Foundation

public enum InternalErrorCodes: Int {
  case jsonParsingError = -10024
}

public enum ErrorTypes: String{
  case internalError = "InternalError"
  case externalError = "ExternalError"
}

public enum ProviderTypes: String{
  case google = "google"
  case linkedin = "linkedin"
}

