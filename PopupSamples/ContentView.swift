//
//  ContentView.swift
//  PopupSamples
//
//  Created by Wataru Fujiwara on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    @State var isPopupShowing = false
    @State var backgroundColor = Color.white
    
    var body: some View {
        ZStack {
            Button {
                withAnimation {
                    isPopupShowing = true
                    backgroundColor = Color.gray
                }
            } label: {
                Text("show popup")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.yellow)
                    .cornerRadius(12)
            }
            if isPopupShowing {
                PopupView(isPresent: $isPopupShowing, parentBackgroundColor: $backgroundColor)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
