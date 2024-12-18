import SwiftUI

struct DestinationCard: View {
    var imageName: String
    var title: String
    var trip: Trip
    @Binding var isInTripInfo: Bool
    @ObservedObject var viewModel: TripViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink {
                TripInfoView(trip: trip, viewModel: viewModel)
                    .onAppear { isInTripInfo = true }
                    .onDisappear { isInTripInfo = false }
            } label: {
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing) {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 250)
                            .cornerRadius(16)
                    }
                    
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
            
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    viewModel.toggleFavorite(trip)
                }
            } label: {
                Image(systemName: viewModel.isFavorite(trip) ? "heart.fill" : "heart")
                    .font(.system(size: 22))
                    .foregroundColor(viewModel.isFavorite(trip) ? .red : .white)
                    .padding(8)
                    .background(Circle().fill(Color.black.opacity(0.3)))
                    .padding(8)
            }
        }
    }
}
