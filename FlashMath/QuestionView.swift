//
//  QuestionView.swift
//  FlashMath
//
//  Created by Robert Martinez on 11/30/23.
//

import SwiftUI

struct QuestionView: View {
    @Environment(ViewModel.self) var viewModel
    
    let colors: [Color] = [.purple, .blue, .green, .purple, .orange].shuffled()
    
    let timer = Timer.publish(every: 1 / 30, on: .main, in: .common).autoconnect()
    
    @State private var timeUsed = 0.0
    
    var timeRemaining: Double {
        max(0, viewModel.timeAllowed - timeUsed)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Question \(viewModel.questionNumber)")
                .fontDesign(.rounded)
                .fontWeight(.black)
            
            Text(viewModel.questionText)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            
            ForEach(0..<viewModel.allAnswers.count, id: \.self) { i in
                Button {
                    select(viewModel.allAnswers[i])
                } label: {
                    Text(viewModel.allAnswers[i].formatted())
                }
                .buttonStyle(.question(color: colors[i]))
            }
            
            Spacer()
            Spacer()
            
            ZStack {
                Capsule()
                    .fill(.white.gradient)
                    .frame(height: 50)
                    .containerRelativeFrame(.horizontal) { value, axis in
                        value * timeRemaining / viewModel.timeAllowed
                    }
                
                Text("Time: " + timeRemaining.formatted(.number.precision(.fractionLength(2))))
                    .font(.largeTitle)
                    .monospacedDigit()
                    .blendMode(.difference)
            }
        }
        .padding(.horizontal)
        .onReceive(timer) { time in
            timeUsed += 1 / 30
            
            if timeUsed >= viewModel.timeAllowed {
                viewModel.gameOver()
            }
        }
        .transition(.push(from: .trailing))
    }
    
    func select(_ number: Int) {
        timer.upstream.connect().cancel()
        
        withAnimation {
            viewModel.check(answer: number)
        }
    }
}

#Preview {
    QuestionView()
        .environment(ViewModel())
}
