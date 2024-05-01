//
//  OTPPopUpItem.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI

struct OTPPopUpItem: PopUpItem {
    let phoneNumber: String
    var image: Image = Image(.otp)
    var title: String = "Send OTP code".localized
    var subTitle: String {
        "We will send the OTP code via SMS. Make sure the number \(phoneNumber) is active"
    }
    var primaryButtonTitle: String = "Confirm".localized
    var secondaryButtonTitle: String = "Cancel".localized
}

extension PopUpItem where Self == OTPPopUpItem {
    static func otp(to phoneNumber: String) -> any PopUpItem {
        OTPPopUpItem(phoneNumber: phoneNumber)
    }
}
