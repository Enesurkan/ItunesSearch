//
//  HeaderFilterSectionModel.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator

struct HeaderFilterDTO {
    let title : String?
    let selectTitleFont : UIFont
    let unSelectTitleFont : UIFont
    let selectBackgroundColor : UIColor?
    let unSelectBackgroundColor : UIColor?
    var select: Bool
    
    public init(title: String,
                selectTitleFont: UIFont = .boldSystemFont(ofSize: 14),
                unSelectTitleFont: UIFont = .systemFont(ofSize: 14),
                selectBackgroundColor: UIColor = .eHeaderSelectBackground,
                unSelectBackgroundColor: UIColor = .eHeaderUnSelectBackground,
                select: Bool = false){
        self.title = title
        self.selectTitleFont = selectTitleFont
        self.unSelectTitleFont = unSelectTitleFont
        self.selectBackgroundColor = selectBackgroundColor
        self.unSelectBackgroundColor = unSelectBackgroundColor
        self.select = select
    }
}

enum HeaderFilterSectionModel{
    case HeaderSection(title: String, data: HeaderFilterDTO, items: [HeaderFilterSectionItem])
    
    var estimatedWidth: CGFloat {
        switch self {
        case .HeaderSection(_, let data, _):
            let currentFont = data.select ? data.selectTitleFont : data.unSelectTitleFont
            return data.title?.widthOfString(usingFont: currentFont, space: 30) ?? 0
        }
    }
}

enum HeaderFilterSectionItem {
    case HeaderSectionItem(title: String, data: HeaderFilterDTO)
}
