//
//  Keys.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import SwiftUI


struct CustomAuthenticationKey : EnvironmentKey{
    static var defaultValue = Authentication()
}


extension EnvironmentValues{
    var Auth : Authentication{
        get{self[CustomAuthenticationKey.self]}
        set{self[CustomAuthenticationKey.self] = newValue}
    }
}
