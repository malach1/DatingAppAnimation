//
//  DateIndicatorTransientView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct DateIndicatorTransientView: View {
    @ObservedObject var viewModel: DatersViewModel

    var body: some View {
        HStack {
            ZStack {
                ZStack  {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio(contentMode: .fit)
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .purple,
                            .blue
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .offset(x: -50)
                
                Text("DATE")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .offset(x: 10)
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 50).opacity(0.3)
                .frame(width: 200, height: 75)
                .opacity(Double(viewModel.yOffset / -SizeConstants.Card.dragRange))
        }
        .opacity(Double(viewModel.yOffset / -SizeConstants.Card.dragRange))
    }
}

#Preview {
    DateLineUpView(viewModel: DatersViewModel(service: DaterService()))
}
