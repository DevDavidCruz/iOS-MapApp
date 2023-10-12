//
//  Protocols.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import SwiftUI

protocol Account{
    static func Register(username: String, email: String, password: String)
    static func Login(email: String, password: String) async throws -> String
    static func Login(username: String, password: String) async throws -> String
    static func Logout() async throws
}
