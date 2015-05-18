//
//  ThirdViewController.swift
//  chasekAssignment6
//
//  Created by Kahlil Chase on 5/14/15.
//  Copyright (c) 2015 Kahlil Chase. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var favoritesSeg: UISegmentedControl!
    @IBOutlet weak var textIn: UITextField!
    @IBOutlet weak var channelStep: UISegmentedControl!
    @IBOutlet weak var channelLab: UILabel!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var save: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func endExit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textEnd(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func stepPress(sender: UISegmentedControl) {
        if let t = channelLab.text {
            if channelStep.selectedSegmentIndex == 0 {
                if let c = t.toInt() {
                    if c != 99 {
                        var out = c + 1
                        channelLab.text = String(out)
                    }
                }
            }
            
            else {
                if let c = t.toInt() {
                    if c != 1 {
                        var out = c - 1
                        channelLab.text = String(out)
                    }
                }
            }
        }
    }
    
    @IBAction func cancelPress(sender: UIButton) {
    }
    
    @IBAction func savePress(sender: UIButton) {
        if let c = channelLab.text {
            if let cToI = c.toInt() {
                data.favorites.append(favorite(but: favoritesSeg.selectedSegmentIndex, lab: textIn.text, chan: cToI))
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}