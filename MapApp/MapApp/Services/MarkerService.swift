//
//  Markers.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import Foundation


class TestMarkersService : Markers{
    
    private init(){}
    
    public static let Shared = TestMarkersService()
    
    static func GetMarkers() async throws -> [CustomMarker]? {
        
        let result = try await Http.Get(url: "http://localhost:8000/markers")
        print(String(data: result, encoding: .utf8))
        let markers = try JSONDecoder().decode([CustomMarker].self, from: result)
        return markers
    }
    
    static func FindMarkersNearby(search: Search) async throws -> [CustomMarker]? {
        
        return nil
    }
    
}
