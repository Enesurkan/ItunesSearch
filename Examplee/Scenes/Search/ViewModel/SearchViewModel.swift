//
//  SearchViewModel.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    
    private var searchRepository = SearchRepository()
    let searchData : BehaviorRelay<[SearchItem]?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    var searchRequestBody = SearchRequest(nil, limit: 20, wrapperType: nil)
    var pagingIndex = 0
    
    func search(){
        searchRepository.search([SearchItem].self, body: searchRequestBody)
            .subscribe(onNext: {[weak self] (response) in
                guard let self = self else {return}
                if self.pagingIndex == 0 {
                   self.searchData.accept(response)
                }else{
                    var oldSearchResult = self.searchData.value ?? []
                    oldSearchResult.append(contentsOf: response)
                    self.searchData.accept(oldSearchResult)
                }
            }, onError: { (error) in
                print(error)
            }).disposed(by: disposeBag)
    }
    
    func setLimit(){
        pagingIndex += 1
        searchRequestBody.offset = self.pagingIndex == 0 ? 0 : (self.pagingIndex * (searchRequestBody.limit ?? 20))
        search()
    }
    
    func resetOffSet(){
        pagingIndex = 0
        searchRequestBody.offset = 0
    }
    
    func setWrapperType(type: String?){
        resetOffSet()
        searchRequestBody.wrapperType = type
    }
}
