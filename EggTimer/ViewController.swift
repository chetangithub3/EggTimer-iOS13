//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining = 60
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        print(sender.currentTitle ?? "afkldaf")
        
        let hardness = sender.currentTitle!
        var secondsRemaining = eggTimes[hardness]
        
//        switch hardness {
//        case eggTimes.values.description:
//            print(eggTimes.keys)
//        default:
//            print("Error")
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        { (Timer) in
            if secondsRemaining! > 0 {
                   print ("\(secondsRemaining!) seconds")
                secondsRemaining! -= 1
               } else {
                   Timer.invalidate()
               }
           }
        }
        
    }
    

