//
//  Question.swift
//  FlashMath
//
//  Created by Robert Martinez on 12/2/23.
//

import Foundation

protocol Question {
    var questionText: String { get set }
    var correctAnswer: Int { get set }
    var allAnswers: [Int] { get set }
    init()
}
