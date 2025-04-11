//
//  ViewController.swift
//  EggTimer
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/4/25.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedEgg = -1
    var timeToBoil = 0
    var currentTime = 0
    var boilTimer : Timer? = nil
    @IBOutlet weak var eggTimerMessage: UILabel!
    
    @IBOutlet weak var startBoilingButton: UIButton!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI(){
        updateEggTimerMessage()
        timerProgressView.isHidden = true
    }
    
    @IBAction func eggButtonTapped(_ sender: UITapGestureRecognizer) {
        // print("Egg button tapped on : \(sender.view?.tag)")
        let tag = sender.view?.tag ?? 0
        switch tag {
        case Constants.SoftEggTag :
            print("You have tapped soft egg")
        case Constants.MediumEggTag :
            print("You have tapped medium egg")
        default :
            print("You have tapped hard egg")
        }
        selectedEgg = tag
        updateEggTimerMessage()
        timeToBoil = Constants.EggBoilTimeMap[selectedEgg] ?? 0
    }
    
    private func updateEggTimerMessage(){
        switch selectedEgg {
            case Constants.SoftEggTag :
            eggTimerMessage.text = "Soft egg is ready in 3 minutes"
        case Constants.MediumEggTag :
            eggTimerMessage.text = "Medium egg is ready in 5 minutes"
        case Constants.HardEggTag :
            eggTimerMessage.text = "Hard egg is ready in 7 minutes"
        default :
            eggTimerMessage.text = "Tap on a egg to see how long it may take to prepare"
        }
        
        if selectedEgg != -1 {
            startBoilingButton.isHidden = false
        } else {
            startBoilingButton.isHidden = true
        }
    }
    
    
    @IBAction func startBoilDidPress(_ sender: UIButton) {
        timerProgressView.isHidden = false
        startBoilingButton.titleLabel?.text = "Boiling..."
        startBoilingButton.isEnabled = false
        startTimer()
    }
    
    
    private func startTimer() {
        currentTime = 0
        boilTimer?.invalidate()
        boilTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { tick in
            self.updateProgress()
        })
    }
    
    private func updateProgress(){
        currentTime += 1
        let progress = Float(currentTime) / Float(timeToBoil)
        
        print(currentTime)
        print("Progress : \(progress)")
        self.timerProgressView.progress = progress
        if currentTime >= timeToBoil {
            startBoilingButton.isHidden = true
            eggTimerMessage.text = "Done! Egg is now boiled. Please choose another egg to restart."
            selectedEgg = -1
            currentTime = 0
            startBoilingButton.titleLabel?.text = "Start Boiling"
            startBoilingButton.isEnabled = true
            stopTimer()
        }
    }
    
    private func stopTimer(){
        boilTimer?.invalidate()
    }
    
}

