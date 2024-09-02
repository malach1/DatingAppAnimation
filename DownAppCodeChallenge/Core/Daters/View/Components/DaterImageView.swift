//
//  DaterImageView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/20.
//

import SwiftUI

struct DaterImageView: View {
    let dater: Dater
    
    var body: some View {
        AsyncImage(url: URL(string: dater.profilePic)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.Card.width, height: SizeConstants.Card.height)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure:
                Text("?")
            default:
                Text("?")
            }
        }
    }
}

#Preview {
    DateLineUpView(viewModel: DatersViewModel(service: DaterService()))
}
