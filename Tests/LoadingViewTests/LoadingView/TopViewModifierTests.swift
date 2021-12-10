//
//  TopViewModifierTests.swift
//  
//
//  Created by Daniel on 17.03.2021.
//

import XCTest
import SwiftUI
@testable import LoadingView

class TopViewModifierTests: XCTestCase {
    
    // MARK: - Test Variables
    
    var sut: BlurViewModifier<Text>!
    var blurRadius: CGFloat = 20
    var destination = Text("Hello World")
    
    @State var isVisible: Bool = false
    
    // MARK: - Setup & Teardown
    
    override func setUp() {
        super.setUp()
        sut = BlurViewModifier(destination: destination, blurRadius: blurRadius, binding: $isVisible)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testBody() throws {
        XCTAssertNotNil(sut.body)
    }
    
    func testConfiguration() throws {
        XCTAssertEqual(sut.blurRadius, blurRadius)
        XCTAssertEqual(sut.destination, destination)
    }
    
    func testShowLoadingView() throws {
        XCTAssertNotNil(destination
            .showLoadingView(when: $isVisible) as? ModifiedContent<Text, BlurViewModifier<DotsActivityView>>)
    }
    
    static var allTests = [
        ("testBody", testBody),
        ("testConfiguration", testConfiguration),
        ("testShowLoadingView", testShowLoadingView)
    ]
}
