//
//  ViewController.swift
//  yoga-health-kit-app
//
//  Created by Kat Drobnjakovic on 2016-03-03.
//  Copyright © 2016 Kat Drobnjakovic. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        
        let coordinates = CLLocationCoordinate2D(latitude: 45.4143192, longitude: -75.6973991)
        let region = CLCircularRegion(center: coordinates, radius: 20.0, identifier: "Pure Yoga")
        manager.startMonitoringForRegion(region)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print(status)
    }
        
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("entered pure yoga")
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("exit pure yoga")
    }

}

