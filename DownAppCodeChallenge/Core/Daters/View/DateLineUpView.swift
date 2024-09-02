//
//  DateLineUpView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct DateLineUpView: View {
    @ObservedObject var viewModel: DatersViewModel
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                LazyHStack(spacing: 25) {
                    ForEach(viewModel.daterModels.indices, id: \.self) { index in
                        let dater = viewModel.daterModels[index]
                        DaterCardView(viewModel: viewModel, currentIndex: $currentIndex, model: dater)
                            .id(index)
                    }
                }
                .scrollTargetLayout()
            }
        }
        .scrollTargetBehavior(.viewAligned)
        .contentMargins(10, for: .scrollContent)
    }
}

#Preview {
    DateLineUpView(viewModel: DatersViewModel(service: DaterService()))
}
