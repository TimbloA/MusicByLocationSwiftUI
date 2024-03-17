//
//  CLPlacemark.swift
//  MusicByLocationSwiftUI
//
//  Created by Timblo, Adi (WING) on 17/03/2024.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationDeatiled() -> String {
        return """
                Street: \(self.thoroughfare ?? "Unknown")
                City: \(self.locality ?? "Unknown")
                Area: \(self.administrativeArea ?? "Unknown")
                Country: \(self.country ?? "Unknown")
                
                """
    }
}
