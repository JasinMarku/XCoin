//
//  TabbedItems.swift
//  XCoin
//
//  Created by Jasin ‎ on 2/20/24.
//

import Foundation

enum TabbedItems: Int, CaseIterable {
    case coins = 0
    case assets
    case profile
    
    
    var title: String {
        switch self {
        case .coins:
            return "Coins"
        case .assets:
            return "Assets"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String {
        switch self {
        case .coins:
            return "coins"
        case .assets:
            return "assets"
        case .profile:
            return "profile"
        }
    }
}
