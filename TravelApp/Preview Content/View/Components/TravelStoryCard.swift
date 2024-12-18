import SwiftUI

struct TravelStoryCard: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 280, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(title)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: 280, alignment: .leading) // Match the image width
                .fixedSize(horizontal: false, vertical: true) // Allow vertical growth
        }
        .frame(width: 280) // Set fixed width for the entire card
    }
}
