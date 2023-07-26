//
//  Extension.swift
//  BuildTinderApp
//
//  Created by Hanh Vo on 7/19/23.
//

import Foundation
import SwiftUI

extension Color {
    static let textPrimary = Color.gray.opacity(0.9)
    static let textSecondary = Color.gray.opacity(0.6)
    static let textTitle = Color.black.opacity(0.8)
    static let defaultBackground = Color(.systemGray6).opacity(0.35)
    static let textfieldBG = Color(.systemGray6)
    static let goldBG = Color(hue: 0.131, saturation: 0.8, brightness: 0.767)
}

#if canImport(UIKit)
extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

extension CGFloat {
   static func calculatePadding(for text: String) -> CGFloat{
        let basePadding: CGFloat = 10
        return basePadding + CGFloat(1 * text.count)
    }
}
