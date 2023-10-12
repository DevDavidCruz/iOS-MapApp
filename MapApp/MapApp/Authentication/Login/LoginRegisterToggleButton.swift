//
//  LoginRegisterToggleButton.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import SwiftUI

struct LoginRegisterToggleButton: View {
    @Binding var index: Int
    
    var body: some View {
        GeometryReader{ geo in
            
            HStack(spacing: -20){
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        self.index = 0
                    }
                    
                }) {
                    
                    Text("Existing")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (geo.size.width - 50) / 2)
                    
                }
                .background(self.index == 0 ? CustomColor.ButtonColor : Color.clear)
                .clipShape(Capsule())
                .padding(.trailing, -5)
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        self.index = 1
                    }
                    
                }) {
                    
                    Text("New")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (geo.size.width - 50) / 2)
                    
                }
                .background(self.index == 1 ? CustomColor.ButtonColor : Color.clear)
                .clipShape(Capsule())
                .padding(.leading, 5)
                
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 25)
            .position(x: geo.size.width/2)
        }
        
        
        
    }
}

struct LoginRegisterToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterToggleButton(index: .constant(0))
    }
}
