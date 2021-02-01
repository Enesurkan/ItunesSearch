//
//  RequestProtocol.swift
//  Examplee
//
//  Created by Enes Urkan on 12/28/20.
//  Copyright © 2020 Enes Urkan. All rights reserved.
//

import Foundation


public protocol RequestProtocol :  Codable  {
    
}

extension RequestProtocol {
    public func asDictionary() -> [String: Any]? {
        if let data = try? JSONEncoder().encode(self), let dict = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            return dict
        }
        return nil
    }
}
