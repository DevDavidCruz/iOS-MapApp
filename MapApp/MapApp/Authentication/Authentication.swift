//
//  LoginViewModel.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import SwiftUI


@Observable class Authentication{
    public var LoggedIn : Bool = false
    
    public func Login(user_name : String, password: String) async -> Bool {
        do{
            let _result = try await TestAccountService.Login(email: user_name, password: password)
            self.LoggedIn = true
            return true
        }
        catch{
            self.LoggedIn = false
            return false
        }
    }
    
    public func CheckIfLoggedIn()->Bool{
        return LoggedIn
    }
}

