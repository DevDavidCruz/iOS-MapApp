//
//  MapView.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var locationManager: LocationManager?
    @State var position : MapCameraPosition = .automatic
    @State var viewModel = MapViewModel()
    @State var items : [MKMapItem] = []
    var body: some View {
        ZStack{
            Map(position: $position){
                ForEach(items, id: \.self){ result in
                    Marker(result.name ?? "", systemImage: "takeoutbag.and.cup.and.straw.fill", coordinate: result.placemark.coordinate)
                }
                UserAnnotation()
            }
            VStack{
                HStack{
                    Button(action:{
                        Task{
                            do{
                                items = try await viewModel.GetMarkers()
                            }
                            catch{
                                print(error.localizedDescription)
                            }
                        }
                    }){
                        Text("Get markers")
                    }
                }
                Spacer()
            }
        }
        .mapStyle(.standard(pointsOfInterest: .excludingAll))
        .onAppear {
            locationManager = LocationManager()
            position = .userLocation(fallback: .automatic)
        }
        .onDisappear{
        }
    }
}

#Preview {
    MapView()
}
