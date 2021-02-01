//
//  HeaderFilterSectionModel+ModelType.swift
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

extension HeaderFilterSectionModel : SectionModelType {
    var items: [HeaderFilterSectionItem] {
        switch  self {
        case .HeaderSection(_, _, let items):
            return items.map {$0}
        }
    }
    
    init(original: HeaderFilterSectionModel, items: [Item]) {
        switch original {
        case .HeaderSection(let title,let data, let items):
            self = .HeaderSection(title: title, data: data, items: items)
        }
    }
    
    typealias Item = HeaderFilterSectionItem
}
