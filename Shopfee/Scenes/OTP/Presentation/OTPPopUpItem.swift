//
//  OTPPopUpItem.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI

struct OTPPopUpItem: PopUpItem {
    var image: Image = Image(.otp)
    var title: String = "Send OTP code"
    var subTitle: String = "We will send the OTP code via SMS. Make sure the number 081234567891 is active"
    var primaryButtonTitle: String = "Confirm"
    var secondaryButtonTitle: String = "Cancel"
}

extension PopUpItem where Self == OTPPopUpItem {
    static var otp: any PopUpItem {
        OTPPopUpItem()
    }
}
