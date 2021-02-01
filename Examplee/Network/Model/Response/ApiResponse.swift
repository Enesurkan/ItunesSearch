//
//  ApiResponse.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation

public struct ApiResponse<T: Codable>: Codable {
    public var resultCount: Int?
    public var results: T
}
