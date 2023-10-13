//
//  KeyChain.swift
//  MapApp
//
//  Created by David Cruz on 10/13/23.
//

import Foundation

class KeyChain {
    static let token_tag = "com.example.key.mytoken"
    
    static public func TokenExists() -> Bool {
        let search_query = [
            kSecClass : kSecClassKey,
            kSecMatchLimit : kSecMatchLimitOne,
            kSecAttrApplicationTag : token_tag,
            kSecReturnAttributes : true,
            kSecReturnData : true
        ] as CFDictionary
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(search_query as CFDictionary, &item)
        
        return status == errSecSuccess
    }
    
    static public func GetToken() throws -> String {
        let search_query = [
            kSecClass : kSecClassKey,
            kSecMatchLimit : kSecMatchLimitOne,
            kSecAttrApplicationTag : token_tag,
            kSecReturnAttributes : true,
            kSecReturnData : true
        ] as CFDictionary
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(search_query as CFDictionary, &item)
        
        guard status == errSecSuccess else {throw KeychainError.unhandledError(status: status)}
        
        guard let existing = item as? [String : Any],
              let token_data = existing[kSecValueData as String] as? Data
        else{
            throw KeychainError.unexpectedTokenData
        }
        if let token = String(data: token_data, encoding: .utf8)
        {
            return token
        }
        else{
            throw KeychainError.unexpectedTokenData
        }
        
    }
    
    
    static public func StoreToken(token : String) throws{
        let store_query = [
            kSecClass : kSecClassKey,
            kSecAttrApplicationTag : token_tag,
            kSecValueData : token
            
        ] as CFDictionary
        
        let status = SecItemAdd(store_query, nil)
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
    }
    
    static public func UpdateToken(token :String) throws{
        let update_query = [
            kSecClass : kSecClassKey,
            kSecAttrApplicationTag : token_tag,
            
        ] as CFDictionary
        
        let update_value = [
            kSecValueData : token.data(using: .utf8)
        ] as CFDictionary
        
        let status = SecItemUpdate(update_query, update_value)
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
    }
}
