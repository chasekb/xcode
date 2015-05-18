//
//  FirstViewController.swift
//  chasekAssignment6
//
//  Created by Kahlil Chase on 5/13/15.
//  Copyright (c) 2015 Kahlil Chase. All rights reserved.
//

import UIKit

var data = configDto()

class FirstViewController: UIViewController {

    var input = [Character]()
    var output = String()
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var chPlus: UIButton!
    @IBOutlet weak var chMinus: UIButton!
    
    @IBOutlet weak var favoritesSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        if !data.favorites.isEmpty {
            for each in data.favorites {
                favoritesSegment.setTitle(each.buttonLab, forSegmentAtIndex: each.buttonID)
            }
        }
    }
    
    @IBAction func switchToggle(sender: UISwitch) {
        let enabled = sender.on
        controlDisabled(enabled)
        
        powerSwitch.setOn(sender.on, animated: true)
        powerLabel.text = (sender.on ? "on" : "off")
    }
    
    @IBAction func sliderSlid(sender: UISlider) {
        volumeLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func buttonPress(sender: UIButton) {
        if let s = sender.currentTitle {
            input.append(Character(s))
        }
        
        if input.count == 2 {
            output = String(input)
            channelLabel.text = output
            input = []
        }
    }
    
    @IBAction func plusPress(sender: UIButton) {
        if let i = output.toInt() {
            if i < 99 {
                output = String(i + 1)
            }
        }
            
        else {
            let i = 2
            output = String(i)
        }
        
        channelLabel.text = output
    }
    
    @IBAction func minusPress(sender: UIButton) {
        if let i = output.toInt() {
            if i > 1 {
                output = String(i - 1)
            }
        }
            
        else {
            let i = 1
            output = String(i)
        }
        
        channelLabel.text = output
    }
    
    @IBAction func favPress(sender: UISegmentedControl) {
        if let s = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex) {
            for each in data.favorites {
                if each.buttonLab == s {
                    channelLabel.text = String(each.buttonChan)
                }
            }
        }
    }
    
    func controlDisabled(enabled: Bool) {
        volumeSlider.enabled = enabled
        volumeLabel.enabled = enabled
        channelLabel.enabled = enabled
        zero.enabled = enabled
        one.enabled = enabled
        two.enabled = enabled
        three.enabled = enabled
        four.enabled = enabled
        five.enabled = enabled
        six.enabled = enabled
        seven.enabled = enabled
        eight.enabled = enabled
        nine.enabled = enabled
        chPlus.enabled = enabled
        chMinus.enabled = enabled
        favoritesSegment.enabled = enabled
        data.powerState = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

