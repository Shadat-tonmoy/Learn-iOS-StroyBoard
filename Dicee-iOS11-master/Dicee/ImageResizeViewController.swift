//
//  ImageResizeViewController.swift
//  Dicee
//
//  Created by Shadat Mufakhkhar Tonmoy on 10/4/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import UIKit


class ImageResizeViewController : UIViewController {
    
    @IBOutlet weak var resolutionPercentLabel: UILabel!
    @IBOutlet weak var qualityPercentLabel: UILabel!
    @IBOutlet weak var resolutionPercentSlider: UISlider!
    @IBOutlet weak var qualityPercentSlider: UISlider!
    
    override func viewDidLoad() {
        setRoundedCorner(label: resolutionPercentLabel)
        setRoundedCorner(label: qualityPercentLabel)
        
        
    }
    
    
    private func setRoundedCorner(label : UILabel) {
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
    }
    
    @IBAction func resolutionPercentDidChange(_ sender: UISlider) {
        updateResolutionPercentLabel(value: sender.value)
    }
    
    
    @IBAction func qualiotyPercentDidChange(_ sender: UISlider) {
        updateQualityPercentLabel(value: sender.value)
    }
    
    private func updateResolutionPercentLabel(value : Float) {
        resolutionPercentLabel.text = "\(Int(value * 100))%"
    }
    
    private func updateQualityPercentLabel(value : Float) {
        qualityPercentLabel.text = "\(Int(value * 100))%"
    }
    
    
    
    
    
    
    
    
}
