//
//  SettingsView.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.Auth) private var _auth
    var body: some View {
        Button(action:{
            do{
                try _auth.Logout()
            }
            catch{
                print("Error logging out")
            }
        }){
            Text("Logout")
        }
    }
}

#Preview {
    SettingsView()
}
