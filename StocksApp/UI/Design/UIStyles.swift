//
//  UIFonts.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import Foundation
import SwiftUI


struct UIStyles {
    struct BodySmall {
        static let font: Font = Font(R.font.robotoRegular(size: 16)!)
        static let color = Color.black
    }
    struct BodyMedium {
        static let font: Font = Font(R.font.robotoRegular(size: 18)!)
        static let color: Color = Color(R.color.lightGray()!)
    }
    struct Headline {
        static let font : Font = Font(R.font.robotoBold(size: 20)!)
        static let color = Color.black
    }
    struct Dimens {
        static let spaceMedium = CGFloat(16)
        static let spaceLarge = CGFloat(24)
        static let spaceXLarge = CGFloat(32)
    }

}

