//
//  TripView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI

struct TripView: View {
    @Binding var isInTripInfo: Bool
    @ObservedObject var viewModel: TripViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Spacer()
                        
                        ZStack {
                            Image(systemName: "bell")
                                .font(.title3)
                                .foregroundColor(.gray)
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
                            DestinationCard(
                                imageName: "lombok",
                                title: "Lombok",
                                trip: Trip(
                                    id: UUID(),
                                    name: "Lombok Paradise",
                                    location: "Lombok, Indonesia",
                                    description: "Experience the untouched beauty of Lombok with pristine beaches, crystal clear waters, and stunning mountain views.",
                                    imageURL: "lombok",
                                    price: 899,
                                    duration: 5,
                                    rating: 4.7,
                                    features: ["Hotel", "Breakfast", "Tour Guide", "Beach Access"],
                                    latitude: -8.6500,
                                    longitude: 116.3200
                                ),
                                isInTripInfo: $isInTripInfo,
                                viewModel: viewModel
                            )
                            DestinationCard(
                                imageName: "bali",
                                title: "Bali",
                                trip: Trip(
                                    id: UUID(),
                                    name: "Bali Adventure",
                                    location: "Bali, Indonesia",
                                    description: "Discover the magic of Bali with its ancient temples, lush rice terraces, and vibrant culture.",
                                    imageURL: "bali",
                                    price: 1099,
                                    duration: 7,
                                    rating: 4.9,
                                    features: ["Hotel", "All Meals", "Tour Guide", "Spa Access"],
                                    latitude: -8.4095,
                                    longitude: 115.1889
                                ),
                                isInTripInfo: $isInTripInfo,
                                viewModel: viewModel
                            )
                            DestinationCard(
                                imageName: "sumba",
                                title: "Sumba",
                                trip: Trip(
                                    id: UUID(),
                                    name: "Sumba Explorer",
                                    location: "Sumba, Indonesia",
                                    description: "Explore the untouched beauty of Sumba island with its unique culture and pristine landscapes.",
                                    imageURL: "sumba",
                                    price: 799,
                                    duration: 4,
                                    rating: 4.6,
                                    features: ["Hotel", "Breakfast", "Local Guide", "Cultural Tours"],
                                    latitude: -9.6500,
                                    longitude: 120.2667
                                ),
                                isInTripInfo: $isInTripInfo,
                                viewModel: viewModel
                            )
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
                            TravelStoryCard(
                                imageName: "story1",
                                title: "Art and Tradition: Exploring Bali's Cultural Scene"
                            )
                            TravelStoryCard(
                                imageName: "story2",
                                title: "Essential Tips for Exploring Lombok Like a Local"
                            )
                        }
                        .padding(.horizontal)
                    }
                    
                    // Add padding at the bottom to avoid tab bar overlap
                    Color.clear
                        .frame(height: 100) // Adjust this value based on your tab bar height
                }
            }
        }
    }
}

#Preview {
    TripView(isInTripInfo: .constant(false), viewModel: TripViewModel())
}
