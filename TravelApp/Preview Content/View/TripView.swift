//
//  TripView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//
import SwiftUI

struct TripView: View {
    @State private var searchText: String = "" // State to hold the search text

    var body: some View {
        NavigationStack {
            VStack {
                if !searchText.isEmpty {
                    Text("Searching for '\(searchText)'")
                        .padding()
                } else {
                    Text("Start typing to search...")
                        .foregroundColor(.gray)
                        .padding()
                }
                
                Spacer()
            }
            .navigationTitle("Trip")
            .searchable(text: $searchText, prompt: "Places, dates, travel plans...") // Add search bar
        }
    }
}

#Preview {
    TripView()
}
//import SwiftUI
//
//struct TripView: View {
//    @State private var searchText: String = "" // State to hold the search text
//    @State private var filteredTrips: [String] = [] // For filtered results (optional demo)
//    
//    var allTrips: [String] = ["Paris", "London", "New York", "Tokyo", "Istanbul"] // Example data
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                // Search Results
//                List {
//                    ForEach(filteredTrips.isEmpty ? allTrips : filteredTrips, id: \.self) { trip in
//                        Text(trip) // Display each trip
//                    }
//                }
//                .listStyle(InsetGroupedListStyle())
//            }
//            .navigationTitle("Trip")
//            .searchable(text: $searchText, prompt: "Search Trips") // Add search bar
//            .onChange(of: searchText) { newValue in
//                filterTrips(for: newValue)
//            }
//        }
//    }
//    
//    /// Filters trips based on the search text
//    private func filterTrips(for query: String) {
//        if query.isEmpty {
//            filteredTrips = []
//        } else {
//            filteredTrips = allTrips.filter { $0.localizedCaseInsensitiveContains(query) }
//        }
//    }
//}
//
//#Preview {
//    TripView()
//}
