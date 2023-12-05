//
//  MultipleQuestion.swift
//  FlashMath
//
//  Created by Robert Martinez on 12/2/23.
//

import Foundation

struct MultipleQuestion: Question {
    var questionText: String
    var correctAnswer: Int
    var allAnswers: [Int]
    
    init() {
        let allMultiples = (2...12).shuffled()
        let multiple = Int.random(in: 2...12)
        
        correctAnswer = Int.random(in: 1...12) * multiple
        questionText = "Multiple of \(multiple)?"
        
        allAnswers = (0...3).map { i in
            if multiple == 2 {
                allMultiples[i] * multiple + 1
            } else {
                allMultiples[i] * multiple + 2
            }
        }
        
        allAnswers.append(correctAnswer)
        allAnswers.shuffle()
    }
}
