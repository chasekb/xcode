//
//  SecondViewController.swift
//  chasekAssignment6
//
//  Created by Kahlil Chase on 5/13/15.
//  Copyright (c) 2015 Kahlil Chase. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var rewind: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var fastForward: UIButton!
    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var pause: UIButton!
    
    var buttonMsg = ""
    var buttonDict: [String: String] = [
        "RW": "Fast rewinding",
        "Play": "Playing",
        "FF": "Fast forwarding",
        "Rec": "Recording",
        "Stop": "Stopped",
        "Pause": "Paused"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func switchToggle(sender: UISwitch) {
        let enabled = sender.on
        controlDisabled(enabled)
        
        powerSwitch.setOn(sender.on, animated: true)
        powerLabel.text = (sender.on ? "on" : "off")
        stateLabel.text = (sender.on ? "Stopped" : "off")
    }
    
    @IBAction func buttonPress(sender: UIButton) {
        setButtonMsg(sender)
        if let p = stateLabel.text {
            
            if p == "Stopped" {
                if buttonMsg == "Playing" || buttonMsg == "Recording" || buttonMsg == "Stopped" {
                    stateLabel.text = buttonMsg
                }
                    
                else {
                    setAlert(sender)
                }
            }
                
            else if p == "Playing" {
                if buttonMsg == "Fast rewinding" || buttonMsg == "Fast forwarding" || buttonMsg == "Paused" || buttonMsg == "Stopped" {
                    stateLabel.text = buttonMsg
                }
                    
                else {
                    setAlert(sender)
                }
                
            }
                
            else if buttonMsg == "Stopped" {
                stateLabel.text = buttonMsg
            }
                
            else {
                setAlert(sender)
            }
            
        }
    }

    func forceAction(alertView: UIAlertAction!) {
        stateLabel.text = "Stopped"
        
        let confirmAction = UIAlertController(title: "confirm", message: "Continuing with requested operation", preferredStyle: UIAlertControllerStyle.Alert)
        
        confirmAction.addAction(UIAlertAction(title: "continue", style: UIAlertActionStyle.Default, handler:setState))
        presentViewController(confirmAction, animated: true, nil)
        
    }
    
    func setAlert(sender: UIButton) {
        var title = "Button pressed is invalid."
        var message = "Force the requested operation, stopping the current operation first?"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        alertController.addAction(UIAlertAction(title: "do it anyway", style: UIAlertActionStyle.Default, handler:forceAction))
        alertController.addAction(UIAlertAction(title: "cancel", style: .Cancel, nil))
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func setButtonMsg(sender: UIButton) {
        if let s = sender.currentTitle {
            if let b = buttonDict[s] {
                buttonMsg = b
            }
        }
    }
    
    func setState(alertView: UIAlertAction!) {
        stateLabel.text = buttonMsg
    }
    
    func controlDisabled(enabled: Bool) {
        stateLabel.enabled = enabled
        rewind.enabled = enabled
        play.enabled = enabled
        fastForward.enabled = enabled
        record.enabled = enabled
        stop.enabled = enabled
        pause.enabled = enabled
        data.powerState = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

