//
//  SubscriptionModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/25/23.
//

import Foundation
import SwiftUI
struct Subscription: Identifiable {
    let id = UUID()
    
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savePercent: Int?
    var tagLine: TagLine = .none
    
    
    enum TagLine: String {
        case mostPopular = "MOST POPULAR"
        case bestValue = "BEST VALUE"
        case none
    }
}

extension Subscription {
    static let example1 = Subscription(
        month: 6,
        monthlyCost: 15.00,
        totalCost: 89.99,
        savePercent: 50,
        tagLine: .bestValue
    )
    
    static let example2 = Subscription(
        month: 3,
        monthlyCost: 20.00,
        totalCost: 59.99,
        savePercent: 3,
        tagLine: .mostPopular
    )
    
    static let example3 = Subscription(
        month: 1,
        monthlyCost: 29.99,
        totalCost: 29.99
    )
}


struct SubscriptionPlan: Identifiable {
    enum SubscriptionType: String {
        case gold
        case plus
        case platinum
    }

    enum PlanDuration: String {
        case oneWeek = "1 Week"
        case oneMonth = "1 Month"
        case sixMonths = "6 Months"
    }
    let id = UUID()
    let subscriptionType: SubscriptionType
    let planDuration: PlanDuration
    let pricePerWeek: Double
    let savePercentage: Double? // This can be nil for 1 week plan as it doesn't apply

    var planValue: String {
        switch planDuration {
        case .oneWeek:
            return "Popular"
        case .oneMonth:
            return ""
        case .sixMonths:
            return "Best Value"
        }
    }
    
    var totalCost: Double {
        switch planDuration {
        case .oneWeek:
            return pricePerWeek
        case .oneMonth:
            return pricePerWeek * 4
        case .sixMonths:
            return pricePerWeek * 4 * 6
        }
    }
    
    var color: Color {
        switch subscriptionType {
        case .gold:
            return .yellow
        case .plus:
            return .red
        case .platinum:
            return .black
        }
        
    }
}

extension SubscriptionPlan {
    static let exampleOneWeek: SubscriptionPlan = SubscriptionPlan(subscriptionType: .gold, planDuration: .oneWeek, pricePerWeek: 18.99, savePercentage: nil)
    
    static let exampleOneMonth: SubscriptionPlan = SubscriptionPlan(subscriptionType: .gold, planDuration: .oneMonth, pricePerWeek: 10.00, savePercentage: 0.47)
    
    static let exampleSixMonths: SubscriptionPlan = SubscriptionPlan(subscriptionType: .gold, planDuration: .sixMonths, pricePerWeek: 5.83, savePercentage: 0.69)
    
    static let exampleGold: [SubscriptionPlan] = [
        SubscriptionPlan(subscriptionType: .gold, planDuration: .oneWeek, pricePerWeek: 18.99, savePercentage: nil),
        SubscriptionPlan(subscriptionType: .gold, planDuration: .oneMonth, pricePerWeek: 10.00, savePercentage: 0.47),
        SubscriptionPlan(subscriptionType: .gold, planDuration: .sixMonths, pricePerWeek: 5.83, savePercentage: 0.69)]
    
    static let examplePlus: [SubscriptionPlan] = [
        SubscriptionPlan(subscriptionType: .plus, planDuration: .oneWeek, pricePerWeek: 12.99, savePercentage: nil),
        SubscriptionPlan(subscriptionType: .plus, planDuration: .oneMonth, pricePerWeek: 6.25, savePercentage: 0.52),
        SubscriptionPlan(subscriptionType: .plus, planDuration: .sixMonths, pricePerWeek: 4.17, savePercentage: 0.68)]
    
    static let examplePlatinum: [SubscriptionPlan] = [
        SubscriptionPlan(subscriptionType: .gold, planDuration: .oneWeek, pricePerWeek: 24.99, savePercentage: nil),
        SubscriptionPlan(subscriptionType: .gold, planDuration: .oneMonth, pricePerWeek: 12.50, savePercentage: 0.50),
        SubscriptionPlan(subscriptionType: .gold, planDuration: .sixMonths, pricePerWeek: 7.50, savePercentage: 0.70)]
    
    
}
