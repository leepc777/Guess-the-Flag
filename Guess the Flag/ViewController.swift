//
//  ViewController.swift
//  Guess the Flag
//
//  Created by sam on 4/27/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button0.layer.borderWidth = 1
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1

        button0.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction? = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        button0.setImage(UIImage(named: countries[0]), for: .normal)
        button1.setImage(UIImage(named: countries[1]), for: UIControlState.normal)
        button2.setImage(UIImage(named: countries[2]), for: UIControlState.normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()

    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title:String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            print("$$ correct \(sender) tag is:\(sender.tag) answer is:\(correctAnswer) \(countries[correctAnswer])")
        } else {
            title = "Wrong"
            score -= 1
            print("$$ Wrong ! \(sender) tag is:\(sender.tag) answer is:\(correctAnswer) this flag is \(countries[sender.tag])")
        }
        
//        let finalScore = "Your score is \(score)"
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Countinue", style: UIAlertActionStyle.default, handler: askQuestion))
        present(ac, animated: true, completion: nil)
        
    }
    
}

