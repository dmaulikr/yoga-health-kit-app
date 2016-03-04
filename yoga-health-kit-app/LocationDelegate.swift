//
//  LocationDelegate.swift
//  yoga-health-kit-app
//
//  Created by Kat Drobnjakovic on 2016-03-04.
//  Copyright © 2016 Kat Drobnjakovic. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationChangeNotification {
    func locationDidUpdate()
}

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    
    var locationUpdateDelegate: LocationChangeNotification?
    
    let manager = CLLocationManager()
    
//    func setup() {
//        manager.delegate = self
//        manager.requestAlwaysAuthorization()
//        
//        let coordinates = CLLocationCoordinate2D(latitude: 45.4143192, longitude: -75.6973991) //pure yoga
//        //let coordinates = CLLocationCoordinate2D(latitude: 45.4199336, longitude: -75.6940381) // shop hq
//        let region = CLCircularRegion(center: coordinates, radius: 10.0, identifier: "Pure Yoga")
//        manager.startMonitoringForRegion(region)
//
//    }
    
    func setup(locationUpdateDelegate: LocationChangeNotification) {
        self.locationUpdateDelegate = locationUpdateDelegate
        
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        
        let coordinates = CLLocationCoordinate2D(latitude: 45.4143192, longitude: -75.6973991) //pure yoga
        //let coordinates = CLLocationCoordinate2D(latitude: 45.4199336, longitude: -75.6940381) // shop hq
        let region = CLCircularRegion(center: coordinates, radius: 10.0, identifier: "Pure Yoga")
        manager.startMonitoringForRegion(region)
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let startTime = NSDate()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(startTime, forKey: "Yoga start time")
        defaults.synchronize()
        locationUpdateDelegate?.locationDidUpdate()
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let startTime = defaults.objectForKey("Yoga start time") as? NSDate {
            let duration = NSDate().timeIntervalSinceDate(startTime)
            defaults.setObject(duration, forKey: "Yoga end time")
            defaults.synchronize()
            locationUpdateDelegate?.locationDidUpdate()
        }
    }
}