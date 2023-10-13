//
//  HomeView.swift
//  MapApp
//
//  Created by David Cruz on 10/12/23.
//

import SwiftUI
import MapKit
import CoreLocation


struct HomeView: View {
    @State var locationManager: LocationManager?
    @State var position : MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position){
            UserAnnotation()
        }
        .onAppear {
            locationManager = LocationManager()
            position = .userLocation(fallback: .automatic)
        }
        .onDisappear{
        }
    }
}

#Preview {
    HomeView()
}
