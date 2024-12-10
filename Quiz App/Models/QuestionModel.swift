//
//  QustionModel.swift
//  Quiz App
//
//  Created by GOTTIMUKKALA RAMESH on 07/12/24.
//

import Foundation
 
struct QuestionModel {
    let question: String
    let options: [String]
    let correctOption: Int
    
    
    static let mathQuestions: [QuestionModel] = [
        QuestionModel(question: "1.    What is sum of 10 + 7 ?", options: ["21", "13", "17", "12"], correctOption: 2),
        QuestionModel(question: "2.    What is value  10 - 8 we get ?", options: ["1", "3", "2", "18"], correctOption: 2),
        QuestionModel(question: "3.    if 10 divided by 2 what is the value ?", options: ["5", "12", "20", "15"], correctOption: 0),
        QuestionModel(question: "4.    if 10 - 30 the sum multiply by 10 ?", options: ["200", "-200", "300", "-300"], correctOption: 1),
        QuestionModel(question: "5.    multiplication of 10 * 7 ?", options: ["21", "13", "17", "70"], correctOption: 3),
        QuestionModel(question: "6.    What is sum of -200 + 70 ?", options: ["270", "-130", "-270", "130"], correctOption: 1),
        QuestionModel(question: "7.    50 - 20 - 30 - 70 - 10 ?", options: ["200", "103", "170", "120"], correctOption: 3),
        QuestionModel(question: "8.    multiplication of 2 * 6 ?", options: ["13", "12", "17", "10"], correctOption: 1),
        QuestionModel(question: "9.    What is sum of 2 + 4 ?", options: ["6", "13", "17", "12"], correctOption: 0),
        QuestionModel(question: "10.    multiplication of 2 * 4 add 22 ?", options: ["6", "13", "30", "12"], correctOption: 2)
    ]
}


