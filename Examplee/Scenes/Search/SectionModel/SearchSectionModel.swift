//
//  SearchSectionModel.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator

enum SearchSectionModel{
    case SearchSection(title: String, items: [SearchSectionItem])
    
    var estimatedHeight: CGFloat {
        switch self {
        case .SearchSection: return 150
        }
    }
    
    var estimatedWidth: CGFloat {
        switch self {
        case .SearchSection: return 150
        }
    }
}

enum SearchSectionItem {
    case SearchSectionItem(item: SearchItem)
}
