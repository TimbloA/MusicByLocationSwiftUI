//
//  LocationHandling.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 03/03/2024.
//

import Foundation
import CoreLocation

class LocationHandling:NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var lastKnownLocation: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    

    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.lastKnownLocation = "Could not perform lookup of location from coordinate information"
                }else{
                    if let firstPlacermark = placemarks?[0] {
                        self.lastKnownLocation = firstPlacermark.locality ?? "Couldn't find locality"
                    }
                }})
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastKnownLocation = "Error finding Location"
    }
}
