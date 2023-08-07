//
//  PurchasePopUp.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/26/23.
//

import SwiftUI

struct PurchasePopUp: View {
    @StateObject var purchaseVm = PurchaseViewModel()
    @State private var selectedTab: SubscriptionPlan.PlanDuration = .oneWeek
    @Binding var isVisible: Bool
    
    var subPackage: [SubscriptionPlan] {
        return  purchaseVm.subscription
    }
    
    let screen = UIScreen.main.bounds
    
    
    var body: some View {
        GeometryReader {geo in
            VStack {
                Spacer().frame(height: 40)
                VStack {
                    Text("Get tinder \(subPackage[0].subscriptionType.rawValue.capitalized)")
                        .foregroundColor(subPackage[0].color)
                        .font(.system(size: 24, weight: .bold))
                    PurchaseSwipePromo()
                        .frame(height: geo.size.height / 3)
                        .padding(.top, -35)
                    
                    HStack {
                        ForEach(subPackage) { sub in
                            PurchaseOptionView(subscription: sub, isSelected: selectedTab == sub.planDuration)
                                .onTapGesture {
                                    selectedTab = sub.planDuration
                                }
                        }
                    }
                    
                    Spacer()
                    Group {
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 45)
                                    .foregroundColor(subPackage[0].color)
                                
                                Text("CONTINUE")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .heavy))
                            }
                        }
                        
                        Button {
                            isVisible = false
                            
                        } label: {
                            Text("NO THANKS")
                                .foregroundColor(.textPrimary)
                                .font(.system(size: 20, weight: .heavy))
                        }

                    }
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
          
                    
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 25, style: .continuous).foregroundColor(.white))
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Recurring billing, cancel anytime.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("This is a bunch of example text that is representing the legal text found on all subscription pages. Out of respect to the original application we will not be copying over their legal text word for word here.")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                
                Spacer()

                
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopUp_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopUp(isVisible: .constant(true))
    }
}
