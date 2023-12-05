//
//  GameOverView.swift
//  FlashMath
//
//  Created by Robert Martinez on 12/1/23.
//

import SwiftUI

struct GameOverView: View {
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            Text("Game over!")
                .titleStyle()
            
            Text("Your score: \(viewModel.questionNumber - 1).")
                .subtitleStyle()
            
            Button("Play Again", action: viewModel.end)
                .buttonStyle(.primary)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundGradient()
    }
}

#Preview {
    GameOverView()
        .environment(ViewModel())
}
