//
//  SearchViewController+SetupUI.swift
//  Examplee
//
//  Created by Enes Urkan on 12/29/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation

extension SearchViewController {
    
    func setupHeaderView(){
        headerFilter.headerData.accept(getHeaderTitleData(titleData: dummyHeaderTitle))
        headerFilterView.addSubview(headerFilter)
        headerFilter.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        self.headerFilter.layoutIfNeeded()
        self.headerFilterView.layoutIfNeeded()
        
        headerFilter.headerDidSelect.subscribe(onNext: {[weak self] (selectIndex) in
            guard let self = self,
            let index = selectIndex
                else {return}
            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            self.viewModel.setWrapperType(type: self.dummyHeaderTitle[index])
            self.viewModel.search()
        }).disposed(by: disposeBag)
        
        headerFilter.clearButtonTapped.subscribe(onNext: {[weak self] (status) in
            guard let self = self,
                let _ = status
            else {return}
            self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            self.viewModel.setWrapperType(type: nil)
            self.viewModel.search()
        }).disposed(by: disposeBag)
    }
    
    func getHeaderTitleData(titleData: [String]) -> [HeaderFilterDTO]{
        return titleData.compactMap { (title) -> HeaderFilterDTO in
            return HeaderFilterDTO(title: title,unSelectBackgroundColor: .clear)
        }
    }
    
}
