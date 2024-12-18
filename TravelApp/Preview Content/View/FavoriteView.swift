//
//  FavoriteView.swift
//  TravelApp
//
//  Created by Lazizbek Fayzullayev on 12/12/24.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: TripViewModel
    @State private var isInTripInfo: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.favoriteTrips.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("No Favorite Trips Yet")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Start exploring and add some trips to your favorites!")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, 100)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 16) {
                        ForEach(viewModel.favoriteTrips) { trip in
                            DestinationCard(
                                imageName: trip.imageURL,
                                title: trip.name,
                                trip: trip,
                                isInTripInfo: $isInTripInfo,
                                viewModel: viewModel
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteView(viewModel: TripViewModel())
} 