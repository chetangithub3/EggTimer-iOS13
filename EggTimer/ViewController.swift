//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleChange: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes  = ["Soft": 5, "Medium": 7, "Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        var secondsRemaining = totalTime - secondsPassed
        
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        { (Timer) in
            if secondsRemaining > 0 {
                var percent : Float = Float(self.secondsPassed) / Float(self.totalTime)
                self.progressBar.progress = percent
                print(percent)
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
                self.secondsPassed += 1
                
               } else {
                   Timer.invalidate()
                   self.titleChange.text = "Done"
                   self.progressBar.progress = 1.0
                   
               }
           }
        }
        
    }
    


