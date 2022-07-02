//
//  ContentView.swift
//  PopupSamples
//
//  Created by Wataru Fujiwara on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingModal = false
        
        var body: some View {
            Button("Show Modal") {
                showingModal = true
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showingModal, content: PopupView.init)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
