import XCTest
import SwiftTreeSitter
import TreeSitterLisp

final class TreeSitterLispTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_lisp())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Lisp grammar")
    }
}
