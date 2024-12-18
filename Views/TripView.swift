struct TripView: View {
    let trip: Trip
    @EnvironmentObject var favoriteManager: FavoriteManager
    
    var body: some View {
        // ... existing view code ...
        Button(action: {
            favoriteManager.toggleFavorite(tripId: trip.id)
        }) {
            Image(systemName: favoriteManager.isFavorite(tripId: trip.id) ? "heart.fill" : "heart")
                .foregroundColor(favoriteManager.isFavorite(tripId: trip.id) ? .red : .gray)
        }
        // ... rest of the view ...
    }
} 