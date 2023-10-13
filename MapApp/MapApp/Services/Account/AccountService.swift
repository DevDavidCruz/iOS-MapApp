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
    
    static func Register(username: String, email: String, password: String) {
    }
    
    static func Login(email: String, password: String) async throws -> String {
        // Call login endpoint for api
        // if endpoint return anything other than statuscode 200
        // then this method should throw
        return "token"
    }
    
    static func Login(username: String, password: String) async throws->String {
        // Call login endpoint for api
        // if endpoint return anything other than statuscode 200
        // then this method should throw
        return "token"
    }
    
    static func Logout() async throws {
        // this method should be responsible for removing stored token
    }
}
