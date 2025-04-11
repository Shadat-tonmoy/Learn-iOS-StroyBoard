//
//  MainViewController.swift
//  Dicee
//
//  Created by Shadat Mufakhkhar Tonmoy on 8/4/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    private let dices : [String] = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    private var leftDiceNumber = 0
    private var rightDiceNumber = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        diceImage1.image = UIImage(named: dices[leftDiceNumber])
        // diceImage1.alpha = 0.5
        
        diceImage2.image = UIImage(named: dices[rightDiceNumber])
    }
    
    @IBAction func rollButtonDidPress(_ sender: UIButton, forEvent event: UIEvent) {
        print("Roll button tapped")
        diceImage1.image = UIImage(named: dices.randomElement() ?? dices[0])
        diceImage2.image = UIImage(named: dices.randomElement() ?? dices[0])
        
    }
    

}
