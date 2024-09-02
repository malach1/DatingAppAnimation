//
//  DaterCardView.swift
//  DownAppCodeChallenge
//
//  Created by Malachi Hul on 2024/08/19.
//

import SwiftUI

struct DaterCardView: View {
    @ObservedObject var viewModel: DatersViewModel
    @Binding var currentIndex: Int
    
    let model: DaterModel
    
    var body: some View {
        if let errorMessage = viewModel.errorMessage {
            Text(errorMessage)
        } else {
            ZStack(alignment: .center) {
                ZStack(alignment: .bottom) {
                    DaterImageView(dater: dater)
                    
                    DaterInfoView(dater: dater)
                        .opacity(viewModel.showUserInfo ? 1 : 0)
                }
                .offset(x: viewModel.xOffset, y: viewModel.yOffset)
                .animation(.snappy, value: viewModel.xOffset)
                .gesture(
                    DragGesture()
                        .onChanged(onDragChanged)
                        .onEnded(onDragEnded)
                )
                
                DateDownIndicatorView(viewModel: viewModel)
                
                if viewModel.choseToDate {
                    LinearGradient(colors: [.blue,  .black], startPoint: .top, endPoint: .bottom).opacity(0.30)
                }
                
                if viewModel.chosenToBeDown {
                    LinearGradient(colors: [.red,  .white], startPoint: .top, endPoint: .bottom).opacity(0.30)
                }
            }
            .frame(width: SizeConstants.Card.width, height: SizeConstants.Card.height)
            .onAppear {
                viewModel.showUserInfo = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
                    viewModel.showUserInfo = true
                }
            }
            .onChange(of: viewModel.showUserInfo) { oldValue, newValue in
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    viewModel.showUserInfo = true
                }
            }
        }
    }
}

// MARK: DaterCardView EXTENSIONS
private extension DaterCardView {
    var dater: Dater {
        return model.dater
    }
}

/// Dragging State
private extension DaterCardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        withAnimation(.easeInOut) {
            viewModel.showUserInfo = false
        }
        viewModel.yOffset = value.translation.height

        if viewModel.yOffset <= -SizeConstants.Card.dragRange{
            viewModel.chosenToBeDown = false
            viewModel.choseToDate = true
            resetCardState()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                chooseToDate()
            }
        } else if viewModel.yOffset >= SizeConstants.Card.dragRange {
            viewModel.chosenToBeDown = true
            viewModel.choseToDate = false
            
            resetCardState()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                chooseToBeDown()
            }
        }
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        withAnimation(.bouncy) {
            resetCardState()
        }
    }
}

/// Position State
private extension DaterCardView {
    func chooseToDate() {
        viewModel.chosenToBeDown = false
        viewModel.choseToDate = true
        prepareForNextProfileWithAnimation()
    }
    
    func chooseToBeDown() {
        viewModel.chosenToBeDown = true
        viewModel.choseToDate = false
        prepareForNextProfileWithAnimation()
    }
    
    func prepareForNextProfileWithAnimation() {
        withAnimation(.easeInOut) {
            viewModel.xOffset = -1000
        } completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                viewModel.removeDater(model)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                viewModel.removeDater(model)
                resetCardState()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                resetDateDownState()
            }
        }
    }
    
    func resetCardState() {
        viewModel.xOffset = 0
        viewModel.yOffset = 0
        viewModel.showUserInfo = true
    }
    
    func resetDateDownState() {
        viewModel.chosenToBeDown = false
        viewModel.choseToDate = false
    }
}
