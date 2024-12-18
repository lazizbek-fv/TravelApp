import SwiftUI
import MapKit

struct TripInfoView: View {
    let trip: Trip
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TripViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Image
                ZStack(alignment: .topLeading) {
                    Image(trip.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Circle().fill(Color.black.opacity(0.5)))
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button {
                            viewModel.toggleFavorite(trip)
                        } label: {
                            Image(systemName: viewModel.isFavorite(trip) ? "heart.fill" : "heart")
                                .foregroundColor(viewModel.isFavorite(trip) ? .red : .white)
                                .padding(12)
                                .background(Circle().fill(Color.black.opacity(0.5)))
                                .padding()
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    // Title and Rating
                    HStack {
                        Text(trip.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", trip.rating))
                                .fontWeight(.semibold)
                        }
                    }
                    
                    // Location
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                        Text(trip.location)
                            .foregroundColor(.gray)
                    }
                    
                    // Price and Duration
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Price")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("$\(trip.price)")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("Duration")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("\(trip.duration) days")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.vertical, 8)
                    
                    // Description
                    Text("About")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(trip.description)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                    
                    // Included Features
                    Text("What's Included")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach(trip.features, id: \.self) { feature in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                Text(feature)
                                    .font(.subheadline)
                                Spacer()
                            }
                        }
                    }
                    
                    // Map View
                    Text("Location")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Map(coordinateRegion: .constant(MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: trip.latitude,
                            longitude: trip.longitude
                        ),
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.05,
                            longitudeDelta: 0.05
                        )
                    )))
                    .frame(height: 200)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
        .overlay(
            VStack {
                Spacer()
                
                // Bottom Booking Bar
                HStack {
                    Button(action: {
                        viewModel.toggleFavorite(trip)
                    }) {
                        Image(systemName: viewModel.isFavorite(trip) ? "heart.fill" : "heart")
                            .font(.title2)
                            .foregroundColor(viewModel.isFavorite(trip) ? .red : .gray)
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                    }
                    
                    Button(action: {
                        // Book trip action
                    }) {
                        Text("Book Now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, y: -5)
            }
        )
    }
}

// Preview
struct TripInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TripInfoView(trip: Trip(
            id: UUID(),
            name: "Bali Adventure",
            location: "Bali, Indonesia",
            description: "Experience the magic of Bali with this comprehensive tour package. Visit ancient temples, relax on pristine beaches, and immerse yourself in the local culture.",
            imageURL: "bali", // Update this to the actual image name in your asset catalog
            price: 1299,
            duration: 7,
            rating: 4.8,
            features: ["Hotel", "Breakfast", "Tour Guide", "Transportation"],
            latitude: -8.4095,
            longitude: 115.1889
        ), viewModel: TripViewModel())
    }
}
