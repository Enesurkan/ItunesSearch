//
//  String+Extension.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func convertDateFormat(inputDate: String) -> String {
        if inputDate == "" {
            return ""
        }
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let oldDate = olDateFormatter.date(from: inputDate)
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "MMM dd yyyy h:mm a"
        return convertDateFormatter.string(from: oldDate!)
    }
    
    func widthOfString(usingFont font: UIFont, space: CGFloat = 0) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width + space
    }
    
}
