//
//  DownIndicatorTransientView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct DownIndicatorTransientView: View {
    @ObservedObject var viewModel: DatersViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "flame.fill")
                .foregroundColor(.red)
            
            Text("HOOKUP")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 50).opacity(0.3)
                .frame(width: 200, height: 75)
                .opacity(Double(viewModel.yOffset / SizeConstants.Card.dragRange))
        }
        .opacity(Double(viewModel.yOffset / SizeConstants.Card.dragRange))
    }
}

#Preview {
    DateLineUpView(viewModel: DatersViewModel(service: DaterService()))
}
