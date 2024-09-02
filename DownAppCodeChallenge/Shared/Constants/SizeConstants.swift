//
//  SizeConstants.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct SizeConstants {
    struct Card {
        static var dragRange: CGFloat {
            (UIScreen.main.bounds.width / 2) * 0.8
        }
        
        static var width: CGFloat {
            UIScreen.main.bounds.width - 20
        }
        
        static var height: CGFloat {
            UIScreen.main.bounds.height / 1.45
        }
    }
}

