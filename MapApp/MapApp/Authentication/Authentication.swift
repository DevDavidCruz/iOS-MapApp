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
    public var Token : String = ""
    
    init(){
        LoggedIn = CheckIfLoggedIn()
    }
    
    public func Register(username: String, email: String, password: String) async throws -> Bool{
        do{
            let result = try await TestAccountService.Register(request: RegisterRequest(username: username, email: email, password: password))
            try ManageToken(token: result)
            self.LoggedIn = true
            return true
        }catch{
            print(error.localizedDescription)
            self.LoggedIn = false
            return false
        }
    }
    
    public func Login(user_name : String, password: String) async throws -> Bool {
        
        do{
            let result = try await TestAccountService.Login(request: LoginRequest(username: user_name, password: password))
            try ManageToken(token: result)
            self.LoggedIn = true
            return true
        }
        catch{
            print(error.localizedDescription)
            self.LoggedIn = false
            return false
        }
    }
    
    public func CheckIfLoggedIn()->Bool{
        do{
            let token = try KeyChain.GetToken()
            Token = token
            return true
        }catch{
            return false
        }
    }
    
    public func Logout() throws {
        try KeyChain.DeleteToken()
        LoggedIn = false
    }
}


private func ManageToken(token : String) throws {
    let token_exists = KeyChain.TokenExists()
    if token_exists{
        try KeyChain.UpdateToken(token: token)
    }
    else{
        try KeyChain.StoreToken(token: token)
    }
}
