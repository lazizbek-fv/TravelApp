import Foundation

struct Favorite: Identifiable, Codable {
    let id: UUID
    let tripName: String
    let imageUrl: String
    
    init(trip: Trip) {
        self.id = trip.id
        self.tripName = trip.name
        self.imageUrl = trip.imageURL
    }
} 
