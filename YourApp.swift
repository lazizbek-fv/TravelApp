@main
struct YourApp: App {
    @StateObject private var favoriteManager = FavoriteManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoriteManager)
        }
    }
} 