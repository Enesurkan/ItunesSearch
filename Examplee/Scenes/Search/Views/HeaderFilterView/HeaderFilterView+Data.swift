//
//  HeaderFilterView+Data.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift

extension HeaderFilterView {
    internal func defineSections(data: [HeaderFilterDTO], selectIndex: Int?) ->  [HeaderFilterSectionModel]{
        
        var sec = [HeaderFilterSectionModel]()
        
        if data.count > 0 {
            Observable.from(data).enumerated().subscribe(onNext: { (arg) in
                var (index, data) = arg
                    if index == selectIndex {
                        data.select = !data.select
                    }else{
                        data.select = false
                    }
                sec.append(.HeaderSection(title: "",
                                          data: data,
                                          items: [.HeaderSectionItem(title: "",
                                                                     data: data)]))
            }).disposed(by: disposeBag)
        }
        
        return sec
    }
}
