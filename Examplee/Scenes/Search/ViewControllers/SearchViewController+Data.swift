//
//  SearchViewController+Data.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift
import Differentiator

extension SearchViewController {
    
    internal func searchDefineSection(_model: [SearchItem]?) ->  [SearchSectionModel]{
        guard let model = _model else {return []}
        var sec = [SearchSectionModel]()
        var aa = [SearchSectionItem]()
        
        _ = model.enumerated().map{ arg in
            let (index, data) = arg
            aa.append(.SearchSectionItem(item: data))
            if (index + 1) % 2 == 0 {
                sec.append(.SearchSection(title: "Search Section", items: aa))
                aa = []
            }
        }
        if aa.count == 1 {
            sec.append(.SearchSection(title: "Search Section", items: aa))
        }
        
        return sec
    }
    
    
}
