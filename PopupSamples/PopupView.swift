//
//  PopupView.swift
//  PopupSamples
//
//  Created by Wataru Fujiwara on 2022/07/02.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresent: Bool
    @Binding var parentBackgroundColor: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Set an Alarm ")
                .font(Font.system(size: 18).bold())
                .foregroundColor(.gray)
            
            Image("alarm_icon")
                .resizable()
                .frame(width: 90, height: 90)
            
            Text("The alarm clock rings at 8:00")
                .font(Font.system(size: 18))
                .foregroundColor(.gray)
                .padding()
            
            Button("Close", role: .none, action: {
                withAnimation {
                    isPresent = false
                    parentBackgroundColor = Color.white
                }
            })
            .buttonStyle(.bordered)
            .background(Color.appPink)
            .tint(Color.white)
            .cornerRadius(.infinity)
            .compositingGroup()
            .shadow(color: Color.appPink.opacity(0.6), radius: 4, x: 0, y: 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.appYellow.opacity(0.6), radius: 16, x: 0, y: 0)
    }
}

struct PopupView_Previews: PreviewProvider {
    @State static var isPresent = true
    @State static var parentBackgroundColor = Color.white
    
    static var previews: some View {
        PopupView(isPresent: $isPresent, parentBackgroundColor: $parentBackgroundColor)
    }
}
