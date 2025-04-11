//
//  Constants.swift
//  EggTimer
//
//  Created by Shadat Mufakhkhar Tonmoy on 11/4/25.
//

import Foundation


class Constants {
    
    static let eggTimerDefaultsKey = "eggTimerDefaultsKey"
    static let SoftEggTag = 0
    static let MediumEggTag = 1
    static let HardEggTag = 2
    static let SoftEggTime = 3
    static let MediumEggTime = 5
    static let HardEggTime = 7
    
    static let EggBoilTimeMap : [Int : Int] = [
        Constants.SoftEggTag : Constants.SoftEggTime,
        Constants.MediumEggTag : Constants.MediumEggTime,
        Constants.HardEggTag : Constants.HardEggTime
    ]
}
