//
//  AccountService.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import SwiftUI


public class TestAccountService : Account{
    private init(){}
    
    public static let Shared = TestAccountService()
    
    static func Register(request : RegisterRequest) async throws -> String{
        let result = try await Http.Post(url: "http://localhost:8000/", body: request)
        guard let result = String(data: result, encoding: .utf8) else{
            throw HttpError.unexpectedError
        }
        return result
    }
    
    /// Login API request.
    /// In this example the login request returns a Auth Token as string to be used in future API calls
    /// - Parameters:
    ///   - email: user account email
    ///   - password: user account password
    /// - Returns: auth token as String
    static func Login(email: String, password: String) async throws -> String {
        return "test"
    }
    
    /// Login API request.
    /// In this example the login request returns a Auth Token as string to be used in future API calls
    /// - Parameters:
    ///   - username: user account username
    ///   - password: user account password
    /// - Returns: auth token as String
    static func Login(request : LoginRequest) async throws->String {
        let result = try await Http.Post(url: "http://localhost:8000/login", body: request)
        guard let result = String(data: result, encoding: .utf8) else {
            throw HttpError.unexpectedError
        }
        return result
    }
    
    static func Logout() async throws {
        // this method should be responsible for removing stored token
    }
}
