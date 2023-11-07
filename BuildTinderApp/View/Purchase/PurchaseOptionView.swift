//
//  PurchaseOptionView.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/26/23.
//

import SwiftUI

struct RoundedTwoCorner: Shape {
   
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 20, height: 20))
        return Path(path.cgPath)
    }
}
struct WeeklyOverlay: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Color.yellow, lineWidth: 1.5)
    }
}

struct NonWeeklyOverlay: View {
    let planValue: String
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.yellow)
                .frame(height: 20)
                .clipShape(RoundedTwoCorner())
            
            Text(planValue)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(.top, 2)
                .padding(.horizontal, 6)
                .minimumScaleFactor(0.1)

            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.yellow, lineWidth: 1.5)
        }
    }
}

struct PurchaseOptionView: View {
    var subscription: SubscriptionPlan
    var isSelected: Bool = false
    var body: some View {
        
        VStack(spacing: 0){
         
            Text(subscription.planDuration.rawValue)
                .font(.system(size: 25, weight: .semibold))
            
            Spacer().frame(height: 2)
            
            Text("$\(subscription.pricePerWeek.formatted())/wk")
                .font(.system(size: 16, weight: .semibold))
            
            Spacer().frame(height: 10)
            
            if let savePercentage = subscription.savePercentage  {
                Text("Save \(Int(savePercentage * 100))%")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundColor(subscription.color)
                    .frame(height: 22)
            } else {
                Spacer().frame(height: 22)
            }
            
            Spacer().frame(height: 12)
            
            Text("$\(subscription.totalCost.formatted())")
                .font(.system(size: 20, weight: .bold))
            
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .foregroundColor(!isSelected ? .textPrimary: .black)
        .overlay {
            if isSelected {
                if subscription.planDuration == .oneMonth {
                    WeeklyOverlay()
                } else {
                    NonWeeklyOverlay(planValue: subscription.planValue)
                }
            }
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            PurchaseOptionView(subscription: SubscriptionPlan.exampleOneWeek, isSelected: true)
            PurchaseOptionView(subscription: SubscriptionPlan.exampleOneMonth, isSelected: true)
            PurchaseOptionView(subscription: SubscriptionPlan.exampleSixMonths, isSelected: true)
        }
       
    }
}
