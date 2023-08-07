//
//  PurchaseOptionViewModel.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/26/23.
//

import Foundation


class PurchaseViewModel: ObservableObject{
    @Published var subscription: [SubscriptionPlan] = []
    
    init() {
        loadSubscription()
    }
    
    private func loadSubscription(){
        subscription = SubscriptionPlan.exampleGold
    }
}

