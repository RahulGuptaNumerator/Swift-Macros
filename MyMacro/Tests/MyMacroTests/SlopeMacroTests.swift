//
//  SlopeMacroTests.swift
//  MyFirstMacro
//
//  Created by Rahul Gupta on 24/07/25.
//
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

final class SlopeSubsetMacroTests: XCTestCase {
    func testSlopeSubset() {
        assertMacroExpansion(
            """
            @SlopeSubset
            enum EasySlope {
                case beginnersParadise
                case practiceRun
            }
            """,
            expandedSource: """

            enum EasySlope {
                case beginnersParadise
                case practiceRun
            
                init?(_ slope: Slope) {
                    switch slope {
                    case .beginnersParadise:
                        self = .beginnersParadise
                    case .practiceRun:
                        self = .practiceRun
                    default:
                        return nil
                    }
                }
            }
            """,
            macros: testMacros
        )
    }

    func testSlopeSubsetOnStruct() throws {
        assertMacroExpansion(
            """
            @SlopeSubset
            struct Skier {
            }
            """,
            expandedSource: """

            struct Skier {
            }
            """,
            diagnostics: [
                DiagnosticSpec(message: "@SlopeSubset can only be applied to an enum", line: 1, column: 1)
            ],
            macros: testMacros
        )
    }

    func testEnumSubset() {
        assertMacroExpansion(
            """
            @EnumSubset<Slope>
            enum EasySlope {
                case beginnersParadise
                case practiceRun
            }
            """,
            expandedSource: """

            enum EasySlope {
                case beginnersParadise
                case practiceRun
            
                init?(_ slope: Slope) {
                    switch slope {
                    case .beginnersParadise:
                        self = .beginnersParadise
                    case .practiceRun:
                        self = .practiceRun
                    default:
                        return nil
                    }
                }
            }
            """,
            macros: testMacros
        )
    }
}
