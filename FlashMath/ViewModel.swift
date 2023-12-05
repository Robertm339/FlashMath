//
//  ViewModel.swift
//  FlashMath
//
//  Created by Robert Martinez on 11/30/23.
//

import Foundation

@Observable
@dynamicMemberLookup
class ViewModel {
    enum PlayState {
        case menu, playing, gameOver
    }
    
    private(set) var playState = PlayState.menu
    var questionNumber = 0
    var question: (any Question)!
    var timeAllowed = 10.0
    
    let allQuestions: [any Question.Type] = [
        MultipleQuestion.self,
        HowManyMultiplesQuestion.self,
        HighestLowestQuestion.self,
        OperationQuestion.self
    ]
    
    subscript<Value>(dynamicMember keyPath: KeyPath<Question, Value>) -> Value {
        question[keyPath: keyPath]
    }
    
    init() {
        nextQuestion()
    }
    
    func nextQuestion() {
        question = allQuestions.randomElement()!.init()
        questionNumber += 1
        timeAllowed *= 0.99
    }
    
    func check(answer: Int) {
        if answer == question.correctAnswer {
            nextQuestion()
        } else {
            gameOver()
        }
    }
    
    func gameOver() {
        playState = .gameOver
        UserDefaults.standard.set(questionNumber - 1, forKey: "LastScore")
    }
    
    func start() {
        playState = .playing
        timeAllowed = 10
        questionNumber = 0
        nextQuestion()
    }
    
    func end() {
        playState = .menu
    }
}
