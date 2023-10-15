//
//  Protocols.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import SwiftUI

// MARK: Account Service structs
struct LoginRequest : Codable{
    var username: String
    var password : String
}
struct RegisterRequest : Codable{
    var username : String
    var email : String
    var password : String
}

// MARK: Account Service Protocol
protocol Account{
    static func Register(request : RegisterRequest) async throws -> String
    static func Login(email: String, password: String) async throws -> String
    static func Login(request : LoginRequest) async throws -> String
    static func Logout() async throws
}



// MARK: Marker Service structs
struct CustomMarker : Codable , Hashable {
    var id : UUID
    var name : String
    var latitude : Double?
    var longitude : Double?
}

struct Search :Codable {
    var latitude : Double
    var longitude : Double
    var radius : Double
}

// MARK: Markers Service Protocol
protocol Markers{
    static func GetMarkers() async throws -> [CustomMarker]?
    static func FindMarkersNearby(search : Search) async throws -> [CustomMarker]?
}
