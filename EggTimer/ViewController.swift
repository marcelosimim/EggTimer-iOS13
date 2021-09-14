//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggsTime = ["Soft": 300, "Medium" : 420, "Hard" : 720]
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        var secondsRemaining = eggsTime[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if secondsRemaining > 0 {
                    self.progressBar.progress += 1.0/Float(self.eggsTime[hardness]!)
                    print ("\(secondsRemaining) seconds")
                    secondsRemaining -= 1
                } else {
                    self.titleLabel.text = "Done!"
                    Timer.invalidate()
                }
    }
    
}
}
