import XCTest
import SwiftUI
@testable import ViewInspector

#if os(iOS)

@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
final class EditButtonTests: XCTestCase {
    
    func testInspect() throws {
        XCTAssertNoThrow(try EditButton().inspect())
    }
    
    func testExtractionFromSingleViewContainer() throws {
        let view = AnyView(EditButton())
        XCTAssertNoThrow(try view.inspect().anyView().editButton())
    }
    
    func testExtractionFromMultipleViewContainer() throws {
        let view = HStack { EditButton(); EditButton() }
        XCTAssertNoThrow(try view.inspect().hStack().editButton(0))
        XCTAssertNoThrow(try view.inspect().hStack().editButton(1))
    }
    
    func testEditMode() throws {
        let view = EditButton()
        XCTAssertNoThrow(try view.inspect().editButton().editMode())
    }
}

#endif
