//
//  DateDownIndicatorView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct DateDownIndicatorView: View {
    @ObservedObject var viewModel: DatersViewModel

    let mask = LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ZStack {
            DateIndicatorTransientView(viewModel: viewModel)
            DateIndicatorStaticView(viewModel: viewModel)
            
            DownIndicatorTransientView(viewModel: viewModel)
            DownIndicatorStaticView(viewModel: viewModel)
        }
    }
}

#Preview {
    DateLineUpView(viewModel: DatersViewModel(service: DaterService()))
}
