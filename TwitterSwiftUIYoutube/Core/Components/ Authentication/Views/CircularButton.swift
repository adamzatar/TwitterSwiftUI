import SwiftUI

struct CircularButton: View {
    var title: String = "Photo" // Text inside the circle
    var color: Color = .blue // Main color for border and content

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height) // Dynamic size
            let iconSize = size * 0.3 // Proportional icon size
            let textSize = size * 0.15 // Proportional text size

            ZStack {
                Circle()
                    .stroke(color, lineWidth: size * 0.05) // Circle border thickness
                    .frame(width: size, height: size) // Circle size

                VStack(spacing: size * 0.05) { // Spacing proportional to size
                    Image(systemName: "plus")
                        .font(.system(size: iconSize, weight: .regular)) // Icon size
                        .foregroundColor(color)

                    Text(title)
                        .font(.system(size: textSize)) // Text size
                        .foregroundColor(color)
                        .minimumScaleFactor(0.5) // Scale down text if needed
                        .lineLimit(1) // Ensure single-line text
                }
            }
        }
    }
}

struct CircularButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularButton(title: "Photo", color: .blue)
            .frame(width: 100, height: 100) // Preview as a 100x100 button
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
