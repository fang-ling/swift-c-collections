import XCTest
@testable import CCollections

final class swift_c_collectionsTests: XCTestCase {
    func testExample() {
        var array = CCollections.Array<Int>()
        
        array.append(19358)
        array.append(12333)
        
        XCTAssertEqual(array[0], 19358)
        XCTAssertEqual(array[1], 12333)
        array[1] = 12321
        XCTAssertEqual(array[1], 12321)
        
        array.swap_at(0, 1)
        XCTAssertEqual(array.to_swift_array(), [12321, 19358])
        
        array.deinit()
    }
}
