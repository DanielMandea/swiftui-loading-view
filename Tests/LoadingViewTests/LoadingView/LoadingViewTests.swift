//
//  LoadingViewTests.swift
//  
//
//  Created by Daniel on 17.03.2021.
//

import XCTest
import SwiftUI
@testable import LoadingView

class LoadingViewTests: XCTestCase {
    
    // MARK: - Test Variables
    
    var sut: DotsActivityView!
    var size: CGFloat = 30
    var color: Color = .blue
    
    // MARK: - Setup & Teardown
    
    override func setUp() {
        super.setUp()
        sut = DotsActivityView(dotSize: size, color: color)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testBody() throws {
        XCTAssertNotNil(sut.body is HStack<TupleView<(DotView, DotView, DotView)>>)
    }
    
    static var allTests = [
        ("testBody", testBody),
    ]
}
