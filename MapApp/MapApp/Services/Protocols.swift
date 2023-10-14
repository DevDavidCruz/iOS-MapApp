//
//  Protocols.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import SwiftUI

struct LoginRequest : Codable{
    var username: String
    var password : String
}
struct RegisterRequest : Codable{
    var username : String
    var email : String
    var password : String
}

protocol Account{
    static func Register(request : RegisterRequest) async throws -> String
    static func Login(email: String, password: String) async throws -> String
    static func Login(request : LoginRequest) async throws -> String
    static func Logout() async throws
}
