//
//  HighestLowestQuestion.swift
//  FlashMath
//
//  Created by Robert Martinez on 12/2/23.
//

import Foundation

struct HighestLowestQuestion: Question {
    var questionText: String
    var correctAnswer: Int
    var allAnswers: [Int]
    
    init() {
        let variant = Int.random(in: 1...3)
        let numberRange: ClosedRange<Int>
        let fluctuation: [Int]
        
        switch variant {
        case 1:
            numberRange = 20...90
            fluctuation = (-5...5).shuffled()
            
        case 2:
            numberRange = 1050...9050
            fluctuation = (-50...50).shuffled()
            
        case 3:
            numberRange = 10_500...900_500
            fluctuation = (-50...50).shuffled()
            
        default:
            fatalError("Unknown variant: \(variant)")
        }
        
        let baseNumber = Int.random(in: numberRange)
        
        allAnswers = (1...5).map { i in
            baseNumber + fluctuation[i]
        }
        
        if Bool.random() {
            questionText = "Highest?"
            correctAnswer = allAnswers.max() ?? 0
        } else {
            questionText = "Lowest?"
            correctAnswer = allAnswers.min() ?? 0
        }
    }
}
