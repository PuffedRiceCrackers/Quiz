//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by PuffedRiceCracker on 29/11/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    var text:String
    var choices:[String]
    var correctAnswer:String
    
    init(q:String, a:[String], correctAnswer:String){
        self.text = q
        self.choices = a
        self.correctAnswer = correctAnswer
    }
}

