//
//  ContactViewController.swift
//  AIU App
//
//  Created by Aba-Bakri on 2/11/20.
//  Copyright © 2020 Ababakri Ibragimov. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ContactViewController: UIViewController {
    
    private let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
}
