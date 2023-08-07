//
//  ShareSheet.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/27/23.
//
import SwiftUI
import Foundation
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Not needed in this case
    }
}
