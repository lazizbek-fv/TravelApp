//
//  TripView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI

struct TripView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                // Top Profile and Notification Bar
                HStack {
                    // Profile Image
                    Image("lombok") // Replace with your image asset
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    Spacer()

                    // Dropdown Type Selector
                    VStack(spacing: 2) {
                        Text("Type")
                            .font(.caption)
                            .foregroundColor(.gray)
                        HStack {
                            Text("Guide")
                                .font(.headline)
                            Image(systemName: "chevron.down")
                                .font(.caption)
                        }
                    }

                    Spacer()

                    // Notification Icon
                    ZStack {
                        Image(systemName: "bell")
                            .font(.title3)
                            .foregroundColor(.gray)

                        // Notification Badge
                        Text("6")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Circle().fill(Color.red))
                            .offset(x: 8, y: -8)
                    }
                }
                .padding(.horizontal)

                // Search Bar
                HStack(spacing: 8) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Where can we take you?")
                            .foregroundColor(.gray)
                            .font(.callout)
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                    )

                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                            )
                    }
                }
                .padding(.horizontal)

                // Section: Begin Your Voyage Here
                VStack(alignment: .leading, spacing: 8) {
                    Text("Begin Your Voyage Here")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text("Unlock your next travel experience")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Horizontal Scroll for Destinations
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        DestinationCard(imageName: "lombok", title: "Lombok")
                        DestinationCard(imageName: "bali", title: "Bali")
                        DestinationCard(imageName: "sumba", title: "Sumba")
                    }
                    .padding(.horizontal)
                }

                // Section: Travel Stories
                VStack(alignment: .leading, spacing: 8) {
                    Text("Travel Stories")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text("Top stories from around the world")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Travel Stories Grid
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        TravelStoryCard(imageName: "story1", title: "Art and Tradition: Exploring Bali's Cultural Scene")
                        TravelStoryCard(imageName: "story2", title: "Essential Tips for Exploring Lombok Like a Local")
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .navigationTitle("")
            .toolbar(.hidden)
        }
    }
}

// MARK: - Destination Card
struct DestinationCard: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack {
            Image(imageName) // Replace with your image asset
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}

// MARK: - Travel Story Card
struct TravelStoryCard: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(imageName) // Replace with your image asset
                    .resizable()
                    .frame(width: 180, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Button(action: {}) {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Circle().fill(Color.black.opacity(0.6)))
                }
                .padding(8)
            }

            Text("GUIDES & TIPS")
                .font(.caption)
                .foregroundColor(.gray)

            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
        }
        .frame(width: 180)
    }
}

#Preview {
    TripView()
}
//import SwiftUI
//
//struct TripView: View {
//    @State private var searchText: String = "" // State to hold the search text
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                HStack {
//                                    HStack {
//                                        Image(systemName: "magnifyingglass")
//                                            .foregroundColor(.gray)
//                                        Text("Where can we take you?")
//                                            .foregroundColor(.gray)
//                                            .font(.callout)
//                                        Spacer()
//                                    }
//                                    .padding()
//                                    .background(Color(.systemGray6))
//                                    .cornerRadius(12)
//
//                                    Button(action: {}) {
//                                        Image(systemName: "slider.horizontal.3")
//                                            .foregroundColor(.gray)
//                                            .padding()
//                                            .background(Color(.systemGray6))
//                                            .cornerRadius(12)
//                                    }
//                                }
//                                .padding(.horizontal)
//                Spacer()
//            }
//            .navigationTitle("Trip")
//        }
//    }
//}
//
//#Preview {
//    TripView()
//}
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
