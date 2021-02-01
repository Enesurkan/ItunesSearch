//
//  SearchViewController+Search.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension SearchViewController {
    
    func subscribeSearchTextField(){
        searchBar.textField.addDoneButtonOnKeyboard()
        
        searchBar.textField
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.count >= 0  }
            .subscribe(onNext: { [weak self] query in
                guard let self = self else {return}
                self.viewModel.resetOffSet()
                if query.count >= 2 {
                    self.viewModel.searchRequestBody.term = query
                    self.viewModel.search()
                }else{
                    self.viewModel.searchRequestBody.term = nil
                    self.setSection([])
                }
            })
            .disposed(by: disposeBag)
    }
}
