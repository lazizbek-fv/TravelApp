import SwiftUI

class TripViewModel: ObservableObject {
    @Published var favoriteTrips: [Trip] = []
    
    func toggleFavorite(_ trip: Trip) {
        if let index = favoriteTrips.firstIndex(where: { $0.id == trip.id }) {
            // If trip is already in favorites, remove it
            favoriteTrips.remove(at: index)
        } else {
            // If trip is not in favorites, add it
            if !favoriteTrips.contains(where: { $0.id == trip.id }) {
                favoriteTrips.append(trip)
            }
        }
    }
    
    func isFavorite(_ trip: Trip) -> Bool {
        favoriteTrips.contains(where: { $0.id == trip.id })
    }
}
