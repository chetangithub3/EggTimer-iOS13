//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {
    var player: AVAudioPlayer?
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
                   self.playSound()
                   
           }
        }
        
    }
    
    func playSound(){
        let _:NSURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")! as NSURL
        do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = self.player else { return }

                player.play()

            } catch let error {
                
    }
    }
    
}

