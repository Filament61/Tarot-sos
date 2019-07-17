//
//  NSSetExtension.swift
//  Tarot
//
//  Created by Serge Gori on 17/07/2019.
//  Copyright © 2019 Serge Gori. All rights reserved.
//


import CoreData


extension NSSet {
    func toArray<T>() -> [T] {
        let array = self.map({ $0 as! T})
        return array
    }
}

