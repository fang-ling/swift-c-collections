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
    public var count : Int {
        get {
            return array.pointee.count
        }
    }
    
    public init() {
        array = array_init(Int(MemoryLayout<T>.size))
    }
    
    public func append(_ new_element : T) {
        var new_element = new_element
        array_append(array, &new_element)
    }
    
    public func to_swift_array() -> [T] {
        var res = [T]()
        for i in 0 ..< count {
            res.append(array_get(array, i)
                .bindMemory(to: T.self,
                            capacity: MemoryLayout<T>.size).pointee)
        }
        return res
    }
}
