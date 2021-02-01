//
//  SearchItem.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation

public struct SearchItem: Codable {
    public var wrapperType: String?
    public var collectionName: String?
    public var artworkUrl100: String?
    public var collectionPrice: Double?
    public var releaseDate: String?
    public var country: String?
    public var currency: String?
    
    public init(){}
}
