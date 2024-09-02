//
//  DaterInfoView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct DaterInfoView: View {
    let dater: Dater
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(dater.name)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(dater.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                .frame(height: 100)
        )
    }
}

#Preview {
    DateLineUpView(viewModel: DatersViewModel(service: DaterService()))
}
