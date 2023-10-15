//
//  MapViewModel.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import Foundation
import MapKit

class MapViewModel : ObservableObject{
    init(){
    }
    
    public func GetMarkers() async throws -> [MKMapItem] {
        let markers = try await TestMarkersService.GetMarkers()
        var items : [MKMapItem] = []
        markers?.forEach{
            let lat = $0.latitude ?? 0.0 as Double
            let lon = $0.longitude ?? 0.0 as Double
            let mark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            let item = MKMapItem(placemark: mark)
            item.name = $0.name
            items.append(item)
        }
        return items
    }
}
