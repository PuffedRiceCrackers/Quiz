//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var points: UILabel!
    
    lazy var choicesButton = [topButton, middleButton, bottomButton]
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
    }

    @IBAction func answerButtonPressed(sender: UIButton) {
        let userGotItRight = quizBrain.isItRightAnswer(sender:sender)
        if userGotItRight == true{
            sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }else{
            sender.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        quizBrain.nextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    func updateUI(){
        // Update Score
        points.text = "Current Point : \(quizBrain.points)"
        // Update Quiz
        questionLabel.text = quizBrain.getNextQuiz()
        // Update Choices
        let choices = quizBrain.getNextChoices()
        for i in 0..<choices.count{
            choicesButton[i]?.setTitle(choices[i], for: .normal)
            choicesButton[i]?.backgroundColor = nil
        }
        // Update ProgressBar
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
    }

    
}

