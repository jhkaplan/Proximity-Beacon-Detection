//
//  ViewController.swift
//  Proximity Beacon Detection
//
//  Created by Josh Kaplan on 1/30/18.
//  Copyright © 2018 Josh Kaplan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")! as UUID, identifier: "Estimotes")
    let Colors = [
        //coconut
        2576: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha:1),
        //lemon
        3465: UIColor(red: 255/255, green: 245/255, blue: 79/255, alpha:1),
        //beetroot
        37047: UIColor(red: 153/255, green: 25/255, blue: 78/255, alpha:1),
        //candy
        49322: UIColor(red: 255/255, green: 188/255, blue: 217/255, alpha:1),
        //blueberry
        38865: UIColor(red: 46/255, green: 49/255, blue: 146/255, alpha:1),
        //mint
        14477: UIColor(red: 159/255, green: 205/255, blue: 174/255, alpha:1)
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeacons(in: region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
        if (knownBeacons.count > 0) {
            let closestBeacon = knownBeacons[0] as CLBeacon
            self.view.backgroundColor = self.Colors[closestBeacon.minor.intValue]
            
        }
    }
}

