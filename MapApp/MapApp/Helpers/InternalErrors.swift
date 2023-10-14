//
//  InternalErrors.swift
//  MapApp
//
//  Created by David Cruz on 10/13/23.
//

import Foundation

enum KeychainError : Error{
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
    case noToken
    case unexpectedTokenData
}

enum HttpError : Error{
    case badRequest
    case unAuthorized
    case invalidURL
    case unexpectedError
}
