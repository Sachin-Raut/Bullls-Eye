//
//  ViewController.swift
//  BullsEye
//
//  Created by Sachin Raut on 02/09/16.
//  Copyright © 2016 Sachin Raut. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    
    @IBOutlet var randomLabel: UILabel!
    
    @IBOutlet var roundLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var slider: UISlider!
    
    var randomNumber = 0
    
    var achievementTitle : String = ""
    
    var bonus = 0
    
    var score = 0
    
    var currentRound = 0
    
    var currentRoundScore = 0
    
    var totalScore = 0
    
    
    
    
    @IBAction func startOver(sender: AnyObject)
    {
        totalScore = 0
        currentRound = 0
        startNewRound()
        updateLabels()
        //scoreLabel.text = String(0)
        //roundLabel.text = String(0)
    }
    
    
    
    
    
    
    @IBAction func hitMePressed(sender: AnyObject)
    {
        
        let sliderValue = Int(slider.value)
        //print(sliderValue)
        
        let difference = abs(randomNumber - sliderValue)
        
        //print(difference)
        
        if difference == 0
        {
            achievementTitle = "Perfect"
            
            bonus = 100
            
        }
        else if difference > 0 && difference < 6
        {
            achievementTitle = "You almost had it"
            
            if difference == 1
            {
                bonus = 40
            }
            else if difference == 2
            {
                bonus = 15
            }
            else if difference == 3
            {
                bonus = 5
            }
            
        }
        else
        {
            achievementTitle = "Not even close..."
            bonus = 0
        }
        
        score = 100 - difference
        
        currentRoundScore = score + bonus
        
        currentRound += 1
        
        totalScore += currentRoundScore
        
        let message = "Target was \(randomNumber) \nYou hit \(sliderValue) \nDifference is \(difference)\n Your Score 100 - \(difference) = \(score) \n Your Bonus = \(bonus) \nTotal Score \(score) + \(bonus)= \(currentRoundScore)"
        
        
        let alert = UIAlertController(title: achievementTitle,
            message: message,
            preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK",
            style: .Default,
            handler: {
                
                    action in
                    self.startNewRound()
                    self.updateLabels()
                
                    })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func updateLabels()
    {
        randomLabel.text = String(randomNumber)
        scoreLabel.text = String(totalScore)
        roundLabel.text = String(currentRound)
    }
    
    func startNewRound()
    {
        //arc4random_uniform does not include upper limit, hence adding 1 can give random number between 1 to 100, instead of 0 to 99
        randomNumber = 1 + Int(arc4random_uniform(100))
        slider.value = 50
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        startNewRound()
        updateLabels()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

