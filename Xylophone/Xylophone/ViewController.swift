//
//  ViewController.swift
//  Xylophone
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/4/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("Got Pressed : name \(sender.titleLabel?.text ?? "No Name")")
        let title = sender.titleLabel?.text ?? "No Name"
        playSound(filename: title, fileExtension: "wav")
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
            sender.layer.opacity = 1
        })
        
    }
    
    

    func playSound(filename: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("Sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
}

