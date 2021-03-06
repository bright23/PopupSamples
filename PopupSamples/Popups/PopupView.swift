//
//  PopupView.swift
//  PopupSamples
//
//  Created by Wataru Fujiwara on 2022/07/02.
//

import SwiftUI

struct PopupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isPopupShowing = false
    @State var isInvitePopupShowing = false
    @State var isCouponPopupShowing = false
    @State var backgroundColor = Color.white
    
    var body: some View {
        ZStack {
            VStack {
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
                Button {
                    withAnimation {
                        isInvitePopupShowing = true
                        backgroundColor = Color.gray
                    }
                } label: {
                    Text("show invite popup")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.yellow)
                        .cornerRadius(12)
                }
                
                Button {
                    withAnimation {
                        isCouponPopupShowing = true
                        backgroundColor = Color.gray
                    }
                } label: {
                    Text("show coupon popup")
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.yellow)
                        .cornerRadius(12)
                }
                
                Button("Dismiss This Modal") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
                    
            if isPopupShowing {
                AlarmPopupView(isPresent: $isPopupShowing, parentBackgroundColor: $backgroundColor)
            }
            if isInvitePopupShowing {
                InvitedPopupView(isPresent: $isInvitePopupShowing, parentBackgroundColor: $backgroundColor)
            }
            if isCouponPopupShowing {
                CouponPopupView(isPresent: $isCouponPopupShowing, parentBackgroundColor: $backgroundColor)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
        .ignoresSafeArea()
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
