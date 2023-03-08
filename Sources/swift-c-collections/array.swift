//
//  array.swift
//  
//
//  Created by Fang Ling on 2023/3/8.
//

import Foundation
import _CCollections

public struct Array<T> {
    var array : UnsafeMutablePointer<_CCollections.Array>
    
    public init() {
        array = array_init(Int(MemoryLayout<T>.size))
    }
    
    public func append(_ new_element : T) {
        var new_element = new_element
        array_append(array, &new_element)
    }
}
