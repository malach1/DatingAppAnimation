//
//  MainTabView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            Text("Date Line Up")
                .tabItem {
                    Label("Down", systemImage: "rectangle.portrait.on.rectangle.portrait.angled.fill")
                }
                .tag(0)
            Text("Snap Match View")
                .tabItem {
                    Label("Snap Match", systemImage: "bolt.circle.fill")
                }
                .tag(1)
            Text("Visitors View")
                .tabItem {
                    Label("Vistors", systemImage: "heart.fill")
                }
                .tag(2)
            Text("Chats View")
                .tabItem {
                    Label("Chats", systemImage: "ellipsis.message.fill")
                }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
