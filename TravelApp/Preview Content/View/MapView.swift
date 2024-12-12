//
//  MapView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    // Default location (e.g., New York City)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    var body: some View {
        NavigationStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea(edges: .all) // Make map fullscreen
            
            .navigationTitle("Map")
        }
    }
}

#Preview {
    MapView()
}
