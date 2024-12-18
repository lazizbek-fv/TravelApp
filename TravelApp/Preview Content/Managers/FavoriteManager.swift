import Foundation
import SwiftUI

class FavoriteManager: ObservableObject {
    @Published var favorites: Set<String> = []
    
    private let defaults = UserDefaults.standard
    private let favoritesKey = "favorites"
    
    init() {
        loadFavorites()
    }
    
    func loadFavorites() {
        if let data = defaults.object(forKey: favoritesKey) as? Data {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                favorites = decoded
            }
        }
    }
    
    func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            defaults.set(encoded, forKey: favoritesKey)
        }
    }
    
    func toggleFavorite(tripId: String) {
        if favorites.contains(tripId) {
            favorites.remove(tripId)
        } else {
            favorites.insert(tripId)
        }
        saveFavorites()
    }
    
    func isFavorite(tripId: String) -> Bool {
        favorites.contains(tripId)
    }
} 