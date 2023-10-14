//
//  RegisterView.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.Auth) private var _auth
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var re_password : String = ""
    var body: some View {
        VStack{
            TextField("Email", text: $email)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .tint(CustomColor.ForegroundColor)
            if !email.isEmpty
            {
                TextField("Username", text: $username)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .tint(CustomColor.ForegroundColor)
                SecureField("Password", text: $password)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .tint(CustomColor.ForegroundColor)
                if !password.isEmpty
                {
                    SecureField("Retype-Password", text: $re_password)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .tint(CustomColor.ForegroundColor)
                }
            }
            
            Button(action:{
                Task{
                    do{
                        //let result = try await _auth.Regi(user_name: user_name, password: password)
                        let result = try await _auth.Register(username: username, email: email, password: password)
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
            .disabled((re_password.elementsEqual(password) && !email.isEmpty && !username.isEmpty))
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
