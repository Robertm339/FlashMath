//
//  FlashMathApp.swift
//  FlashMath
//
//  Created by Robert Martinez on 11/29/23.
//

import SwiftUI

@main
struct FlashMathApp: App {
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environment(viewModel)
        }
    }
}
