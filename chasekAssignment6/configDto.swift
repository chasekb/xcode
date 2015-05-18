//
//  configDto.swift
//  chasekAssignment6
//
//  Created by Kahlil Chase on 5/14/15.
//  Copyright (c) 2015 Kahlil Chase. All rights reserved.
//

import UIKit

class configDto {
    
    var powerState = false
    var favorites = [favorite]()
    var test = "This is a test."
}

class favorite {
    
    var buttonID: Int
    var buttonLab: String
    var buttonChan: Int
    
    init(but:Int, lab:String, chan:Int) {
        buttonID = but
        buttonLab = lab
        buttonChan = chan
    }
}