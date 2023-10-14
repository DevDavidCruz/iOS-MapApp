//
//  RootView.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import SwiftUI

struct RootView: View {
    @Environment(\.Auth) private var _auth
    @State private var loggedin : Bool = false
    @State var index = 0
    
    var body: some View {
        VStack(alignment: .center){
            if(_auth.LoggedIn)
            {
                TabView{
                    ZStack{
                        HomeView()
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    ZStack{
                        SettingsView()
                    }
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
            }
            else
            {
                VStack(alignment: .center){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(EdgeInsets(top: 100, leading: 0, bottom: 100, trailing: 0))
                    LoginRegisterToggleButton(index: $index)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        .frame(height: 50.0)
                        
                    
                    if(index == 0)
                    {
                        LoginView()
                    }
                    else if(index == 1)
                    {
                        RegisterView()
                    }
                    Spacer()
                }
                
            }
        }
        
    }
    
}


#Preview {
    RootView()
}
