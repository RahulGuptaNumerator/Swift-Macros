//
//  SlopeModel.swift
//  Testing Macros
//
//  Created by Rahul Gupta on 24/07/25.
//
import Foundation
import MyMacro

/// Slopes in my favorite ski resort.
@SlopeSubset
enum Slope {
    case beginnersParadise
    case practiceRun
    case livingRoom
    case olympicRun
    case blackBeauty
}

/// Slopes suitable for beginners. Subset of `Slopes`.
@EnumSubset<Slope>
enum EasySlope {
    case beginnersParadise
    case practiceRun

//    init?(_ slope: Slope) {
//        switch slope {
//        case .beginnersParadise: self = .beginnersParadise
//        case .practiceRun: self = .practiceRun
//        default: return nil
//        }
//    }

    var slope: Slope {
        switch self {
        case .beginnersParadise: return .beginnersParadise
        case .practiceRun: return .practiceRun
        }
    }
}
