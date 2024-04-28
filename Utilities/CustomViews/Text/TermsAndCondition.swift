//
//  TermsAndCondition.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 27/04/2024.
//

import SwiftUI

struct TermsAndCondition: View {
    let privacyAction: Action
    let termsAction: Action
    
    var body: some View {
        Text(attributedString)
            .foregroundStyle(.neutralDark.opacity(0.5))
            .font(.custom(size: 12, weight: .regular))
            .environment(\.openURL, OpenURLAction(handler: { url in
                if url.absoluteString.contains("privacy") {
                    privacyAction()
                }
                
                if url.absoluteString.contains("terms") {
                    termsAction()
                }
                
                return .discarded
            }))
    }
    
    var attributedString: AttributedString {
        var string = AttributedString("terms and condition".localized)
        
        if let privacyRange = string.range(of: "privacy policy".localized) {
            string[privacyRange].link = URL(string: "privacy")
            string[privacyRange].underlineStyle = .single
            string[privacyRange].foregroundColor = .info
            string[privacyRange].font = .custom(size: 12, weight: .bold)
        }
        
        if let termsRange = string.range(of: "terms of service".localized) {
            string[termsRange].link = URL(string: "terms")
            string[termsRange].underlineStyle = .single
            string[termsRange].foregroundColor = .info
            string[termsRange].font = .custom(size: 12, weight: .bold)
        }
        
        return string
    }
}

#Preview {
    TermsAndCondition(privacyAction: {}, termsAction: {})
}
