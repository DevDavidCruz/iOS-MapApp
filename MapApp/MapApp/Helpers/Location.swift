//
//  Location.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

@Observable class LocationManager : NSObject, CLLocationManagerDelegate{
    
    private var locationManager = CLLocationManager()
    
    override init()
    {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    public var user_location: CLLocationCoordinate2D?
    public var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Handle changes in location authorization status
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            // Location access granted
            if let location = self.locationManager.location{
                user_location = location.coordinate
                region.center = location.coordinate
                region.span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            }
            
            break
        case .denied, .restricted:
            // Location access denied
            break
        default:
            // Handle other cases, if needed
            break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            user_location = location.coordinate
            region.center = location.coordinate
            region.span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        }
    }
}

extension MKCoordinateRegion : Equatable{
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        
        if ((lhs.center.latitude == rhs.center.latitude) && (lhs.center.longitude == rhs.center.longitude)) {
            if (lhs.span.longitudeDelta == rhs.span.longitudeDelta) && (lhs.span.latitudeDelta == rhs.span.latitudeDelta){
                return true
            }
            return false
        }
        return false
    }
    
    
}
