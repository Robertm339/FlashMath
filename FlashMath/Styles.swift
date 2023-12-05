//
//  Styles.swift
//  FlashMath
//
//  Created by Robert Martinez on 12/1/23.
//

import SwiftUI

extension View {
    func titleStyle() -> some View {
        self
            .font(.system(size: 48))
            .fontWidth(.condensed)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
    }
    
    func subtitleStyle() -> some View {
        self
            .font(.title.bold())
            .padding(.bottom, 40)
            .foregroundStyle(.secondary)
    }
    
    func backgroundGradient() -> some View {
        self
            .background(LinearGradient(colors: [.indigo, .black], startPoint: .top, endPoint: .bottom))
    }
}

struct QuestionButton: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle.bold())
            .shadow(color: configuration.isPressed ? .clear : .black.opacity(0.75), radius: 3)
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? .white : color)
            .clipShape(.capsule)
            .foregroundStyle(configuration.isPressed ? . blue : .white)
            .shadow(radius: configuration.isPressed ? 0 : 10)
    }
}

extension ButtonStyle where Self == QuestionButton {
    static func question(color: Color) -> QuestionButton {
        QuestionButton(color: color)
    }
}

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title.bold())
            .foregroundStyle(configuration.isPressed ? .white : .blue)
            .padding(10)
            .padding(.horizontal, 10)
            .background(configuration.isPressed ? .blue : .white)
            .clipShape(.capsule)
    }
}

extension ButtonStyle where Self == PrimaryButton {
    static var primary: PrimaryButton {
        PrimaryButton()
    }
}
