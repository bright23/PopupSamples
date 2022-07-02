//
//  CouponPopupView.swift
//  PopupSamples
//
//  Created by Wataru Fujiwara on 2022/07/02.
//

import SwiftUI

struct CouponPopupView: View {
    @Binding var isPresent: Bool
    @Binding var parentBackgroundColor: Color
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                HStack {
                    SelectionView(plan: UsagePlan.free, function: {
                        self.isPresent = false
                        self.parentBackgroundColor = .white
                    })
                    .frame(minWidth: 0, maxWidth: .infinity)
                    SelectionView(plan: UsagePlan.standard, function: {
                        self.isPresent = false
                        self.parentBackgroundColor = .white
                    })
                    .frame(minWidth: 0, maxWidth: .infinity)
                    SelectionView(plan: UsagePlan.pro, function: {
                        self.isPresent = false
                        self.parentBackgroundColor = .white
                    })
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
        }
    }
}

struct CouponPopupView_Previews: PreviewProvider {
    @State static var isPresent = true
    @State static var parentBackgroundColor = Color.gray
    
    static var previews: some View {
        CouponPopupView(isPresent: $isPresent, parentBackgroundColor: $parentBackgroundColor)
    }
}

enum UsagePlan {
    case free, standard, pro
    
    var price: Int {
        switch self {
        case .free:
            return 0
        case.standard:
            return 59
        case .pro:
            return 99
        }
    }
    
    var text: String {
        switch self {
        case .free:
            return "this is for tutorial user"
        case.standard:
            return "this is for standard user"
        case .pro:
            return "this is for professional user"
        }
    }
}

struct SelectionView: View {
    let plan: UsagePlan
    var tapped: () -> Void
    
    init(plan: UsagePlan, function: @escaping () -> Void) {
        self.plan = plan
        self.tapped = function
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                Spacer().frame(height: 20)
                HStack(spacing: 0) {
                    Text("\(plan.price)")
                        .font(Font.system(size: 32).bold())
                    Text("$")
                        .font(Font.system(size: 16))
                }
                
                
                Text(plan.text)
                    .font(Font.system(size: 18))
                    .foregroundColor(.gray)
                
                Button("Buy", role: .none, action: {
                    withAnimation {
                        self.tapped()
                    }
                })
                .buttonStyle(.bordered)
                .background(Color.appPink)
                .tint(Color.white)
                .cornerRadius(12)
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.6), radius: 6, x: 0, y: 0)
            
            Image("invite_icon")
                .resizable()
                .frame(width: 80, height: 80)
                .offset(y:-100)
        }
    }
}
