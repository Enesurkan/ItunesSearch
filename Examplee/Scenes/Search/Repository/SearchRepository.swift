//
//  SearchRepository.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation
import RxSwift

class SearchRepository {
    
    func search<T>(_ dump: T.Type, body: SearchRequest) -> Observable<T> where T : Decodable, T : Encodable {
        return  provider.rx
            .request(.search(body: body))
            .observeOn(MainScheduler.instance)
            .map(ApiResponse<T>.self)
            .map{result in result.results}
            .asObservable()
    }
    
    
}
