//
//  ViewController.swift
//  yoga-health-kit-app
//
//  Created by Kat Drobnjakovic on 2016-03-03.
//  Copyright © 2016 Kat Drobnjakovic. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, LocationChangeNotification {
    
    let locationDelegate = LocationDelegate()
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationDelegate.setup(self)
        
        updateLabels()
    }
    
    func locationDidUpdate() {
        updateLabels()
    }
    
    func updateLabels() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let startTime = defaults.objectForKey("Yoga start time") as? NSDate {
            startLabel.text = "Yoga started at \(startTime)"
        }
        else {
            startLabel.text = "Dont have it"
        }
        
        if let duration = defaults.objectForKey("Yoga end time") as? NSTimeInterval {
            endLabel.text = "Yoga lasted for \(duration)"
        }
        else {
            endLabel.text = "namaste"
        }

    }
}

