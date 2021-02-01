//
//  SearchSectionModel+ModelType.swift
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

extension SearchSectionModel: SectionModelType {
    
    typealias Item = SearchSectionItem
    
    var items: [SearchSectionItem] {
        switch  self {
        case .SearchSection(title: _, items: let items):
            return items.map {$0}
        }
    }
    
    init(original: SearchSectionModel, items: [Item]) {
        switch original {
        case let .SearchSection(title: title, items: items):
            self = .SearchSection(title: title, items: items)
        }
    }
}
