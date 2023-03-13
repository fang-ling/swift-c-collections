//
//  binary-heap.swift
//  
//
//  Created by Fang Ling on 2023/3/13.
//

import Foundation
import _CCollections

//TO-DO: Support Generic type
//See: https://chris.eidhof.nl/post/swift-c-interop/

public class BinaryHeap {
    var heap : UnsafeMutablePointer<_CCollections.BinaryHeap>
    
    public var count : Int {
        get {
            return heap.pointee.count
        }
    }
    
    public var is_empty : Bool {
        get {
            return heap.pointee.is_empty
        }
    }

    public init() {
        typealias cb = @convention(c) (UnsafeMutableRawPointer?,
                                       UnsafeMutableRawPointer?) -> Int64
        heap = binary_heap_init(Int64(MemoryLayout<Int>.size)) { lhs, rhs in
            let l = lhs!.bindMemory(to: Int.self,
                                   capacity: MemoryLayout<Int>.size).pointee
            let r = rhs!.bindMemory(to: Int.self,
                                   capacity: MemoryLayout<Int>.size).pointee
            return r > l ? -1 : (r == l ? 0 : 1)
        }
    }
    
    public func `deinit`() {
        binary_heap_deinit(heap)
    }
    
    public func max() -> Int {
        return binary_heap_max(heap)
            .bindMemory(to: Int.self,
                        capacity: MemoryLayout<Int>.size).pointee
    }
    
    public func insert(_ element : Int) {
        var element = element
        binary_heap_insert(heap, &element)
    }
    
    public func remove() -> Int {
        return binary_heap_remove(heap)
            .bindMemory(to: Int.self,
                        capacity: MemoryLayout<Int>.size).pointee
    }
    
    public func removen() {
        binary_heap_remove(heap)
    }
}
