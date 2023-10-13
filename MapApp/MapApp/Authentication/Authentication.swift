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
    
    public func Login(user_name : String, password: String) async throws -> Bool {
        
        do{
            let result = try await TestAccountService.Login(email: user_name, password: password)
            
            let tag = "com.example.key.mytoken"
            
            /// Search for token
            let token_exists = KeyChain.TokenExists()
            /// Token not found then we insert token
            ///
            if token_exists{
                try KeyChain.UpdateToken(token: result)
            }
            else{
                try KeyChain.StoreToken(token: result)
            }
            ///
            
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
}


