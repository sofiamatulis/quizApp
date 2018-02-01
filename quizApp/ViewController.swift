//
//  ViewController.swift
//  quizApp
//
//  Created by Sofia Matulis on 2018-02-01.
//  Copyright © 2018 Sofia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let questions = ["How much is 1 + 1?", "What is the capital of Brazil?", "How old am i?" ]
    let answers = [["2", "5","10"], ["Sao Paulo", "Brasilia", "Minas Gerais"], ["24", "29", "21"]]
    
    // Variables
    // creating the variable for the current question
    // creating variable for where the right answer is
    var currentQuestion = 0
    // I dont understand what UInt32 is
    var rightAnswerPlacement:UInt32 = 0
    // Where the right answer is located . Randomizes it
    //Creating the Label (dragged from the view)
    @IBOutlet weak var lbl: UILabel!
    
    //Button (creating the button --> when the right answer is selected we print "right"
    
    @IBAction func action(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("Right")
        } else
        {
            print ("Wrong")
        }
        // only call next question if theres another one (if its not the length of the questions dont do it
        if (currentQuestion != questions.count) {
            newQuestion()
        }
    }
    
    // calling the function when the view appeared
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    // Function that displays new question
    
    func newQuestion() {
        // writing the first question
        lbl.text = questions[currentQuestion]
        // generates a random place for the right answer
        rightAnswerPlacement = arc4random_uniform(3)+1
        // + 1 because you dont want 0 to ever happen
        // Create a button
        var button:UIButton = UIButton();
        // creating a variable for other questions
        var x = 1
        
        for i in 1...3
        {
           // Create a button
            button = view.viewWithTag(i) as! UIButton
            // if you picked the right answer, 
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x += 1
            }
        }
        currentQuestion += 1

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

