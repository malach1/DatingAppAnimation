//
//  MainTabView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct MainTabView: View {
    
    private let service: DataServiceProtocol
    @StateObject var viewModel: DatersViewModel
    
    init(service: DataServiceProtocol) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: DatersViewModel(service: service))
    }
    
    var body: some View {
        TabView {
            DateLineUpView(viewModel: viewModel)
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
    MainTabView(service: DaterService())
}
