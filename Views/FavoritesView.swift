struct FavoritesView: View {
    @EnvironmentObject var favoriteManager: FavoriteManager
    @StateObject var viewModel = TripsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(viewModel.trips.filter { trip in
                        favoriteManager.isFavorite(tripId: trip.id)
                    }) { trip in
                        TripView(trip: trip)
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
    }
} 