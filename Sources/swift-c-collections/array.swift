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
    
    public var is_empty : Bool {
        get {
            return array.pointee.is_empty
        }
    }
    
    public init() {
        array = array_init(Int(MemoryLayout<T>.size))
    }
    
    /* It's caller's responsibility to free the array. */
    public func `deinit`() {
        array_deinit(array)
    }
    
    public func append(_ new_element : T) {
        var new_element = new_element
        array_append(array, &new_element)
    }
    
    public func insert(_ new_element : T, at i : Int) {
        var new_element = new_element
        array_insert(array, i, &new_element)
    }
    
    public func swap_at(_ i : Int, _ j : Int) {
        array_swap_at(array, i, j)
    }
    
    public subscript(index : Int) -> T {
        get {
            return array_get(array, index)
                .bindMemory(to: T.self,
                            capacity: MemoryLayout<T>.size).pointee
        }
        set(new_element) {
            var new_element = new_element
            array_set(array, index, &new_element)
        }
    }
    
    public func remove(at index : Int) -> T {
        let buf_ptr = array_remove(array, index)
            .bindMemory(to: T.self, capacity: MemoryLayout<T>.size)
        let buf = buf_ptr.pointee
        free(buf_ptr)
        return buf
    }
    
//    public func remove(at index : Int) {
//        array_removen(array, index)
//    }
    
    public func remove_last() -> T {
        let buf_ptr = array_remove_last(array)
            .bindMemory(to: T.self, capacity: MemoryLayout<T>.size)
        let buf = buf_ptr.pointee
        free(buf_ptr)
        return buf
    }
    
//    public func remove_last() {
//        array_remove_lastn(array)
//    }
    
    public func remove_first() -> T {
        let buf_ptr = array_remove_first(array)
            .bindMemory(to: T.self, capacity: MemoryLayout<T>.size)
        let buf = buf_ptr.pointee
        free(buf_ptr)
        return buf
    }
    
//    public func remove_first() {
//        array_remove_firstn(array)
//    }
    
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
