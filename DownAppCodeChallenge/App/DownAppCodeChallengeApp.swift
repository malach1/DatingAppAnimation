//
//  DownAppCodeChallengeApp.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

@main
struct DownAppCodeChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(service: DaterService())
                .preferredColorScheme(.dark)
        }
    }
}
