import Foundation
import MapKit

struct Trip: Identifiable, Equatable {
    let id: UUID
    let name: String
    let location: String
    let description: String
    let imageURL: String
    let price: Int
    let duration: Int
    let rating: Double
    let features: [String]
    let latitude: Double
    let longitude: Double
    
    static func == (lhs: Trip, rhs: Trip) -> Bool {
        lhs.id == rhs.id
    }
}
