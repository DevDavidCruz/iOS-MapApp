//
//  LoginView.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.Auth) private var _auth
    @State private var user_name : String = ""
    
    @State private var password : String = ""
    var body: some View {
        
        VStack{
            TextField("Username", text: $user_name)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .tint(CustomColor.ForegroundColor)
            SecureField("Password", text: $password)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .tint(CustomColor.ForegroundColor)
            
            Button(action:{
                Task{
                    do{
                        let result = try await _auth.Login(user_name: user_name, password: password)
                        if (result == false) {
                            print("Error logging in")
                        }
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                }
            })
            {
                Text("Login")
                    .font(Font.title2)
                    .fontWeight(.bold)
                    .tint(CustomColor.ForegroundColor)
            }
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
