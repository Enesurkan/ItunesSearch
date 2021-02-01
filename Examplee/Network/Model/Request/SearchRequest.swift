//
//  SearchRequest.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation

public struct SearchRequest: RequestProtocol {
    public var term: String?
    public var limit: Int?
    public var wrapperType: String?
    public var offset: Int?
    
    public init(_ term: String?,
                limit : Int = 20,
                offset: Int = 0,
                wrapperType: String?){
        self.term = term
        self.limit = limit
        self.offset = offset
        self.wrapperType = wrapperType
    }
}
