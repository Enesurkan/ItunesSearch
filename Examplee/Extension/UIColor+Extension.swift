//
//  UIColor+Extension.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var eHeaderSelectBackground : UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                    ColorUtil().hexStringToUIColor(hex: "#FFFFFF") :
                    ColorUtil().hexStringToUIColor(hex: "#FFFFFF")
            }
        } else {
            return ColorUtil().hexStringToUIColor(hex: "#FFFFFF")
        }
    }
    
    static var eHeaderUnSelectBackground : UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                    ColorUtil().hexStringToUIColor(hex: "#EDEDEE") :
                    ColorUtil().hexStringToUIColor(hex: "#EDEDEE")
            }
        } else {
            return ColorUtil().hexStringToUIColor(hex: "#EDEDEE")
        }
    }
    
    static var eHeaderSelectTextColor : UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                    ColorUtil().hexStringToUIColor(hex: "#000000") :
                    ColorUtil().hexStringToUIColor(hex: "#000000")
            }
        } else {
            return ColorUtil().hexStringToUIColor(hex: "#000000")
        }
    }
}
