//
//  InvitedPopupView.swift
//  PopupSamples
//
//  Created by Wataru Fujiwara on 2022/07/02.
//

import SwiftUI

struct InvitedPopupView: View {
    @Binding var isPresent: Bool
    @Binding var parentBackgroundColor: Color
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                
                Spacer().frame(height: 60)
                Text("Invited Success💁")
                    .font(Font.system(size: 18).bold())
                
                
                Text("Get 100 Coins\nOpen Message And Receive")
                    .font(Font.system(size: 18))
                    .foregroundColor(.gray)
                    .padding()
                
                HStack {
                    Button("Not Now", role: .cancel, action: {
                        withAnimation {
                            isPresent = false
                            parentBackgroundColor = Color.white
                        }
                    })
                    .buttonStyle(.bordered)
                    .tint(Color.appPink)
                    .cornerRadius(12)
                    
                    Button("Open Message", role: .none, action: {
                        withAnimation {
                            isPresent = false
                            parentBackgroundColor = Color.white
                        }
                    })
                    .buttonStyle(.bordered)
                    .background(Color.appPink)
                    .tint(Color.white)
                    .cornerRadius(12)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            
            Circle()
                .offset(y: -110)
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .overlay {
                    Image("invite_icon")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .offset(y: -110)
                }
            
        }
        
        .shadow(color: Color.appYellow.opacity(0.6), radius: 16, x: 0, y: 0)
    }
}

struct InvitedPopupView_Previews: PreviewProvider {
    @State static var isPresent = true
    @State static var parentBackgroundColor = Color.white
    
    static var previews: some View {
        InvitedPopupView(isPresent: $isPresent, parentBackgroundColor: $parentBackgroundColor)
    }
}
