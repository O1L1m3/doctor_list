//  Created by Emilio

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 4) {
            let fullStars = Int(rating)
            let hasHalfStar = rating - Double(fullStars) >= 0.5
            let emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0)

            ForEach(0..<fullStars, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.colorPink)
            }
            
            if hasHalfStar {
                Image(systemName: "star.leadinghalf.fill")
                    .foregroundColor(.colorPink)
            }

            ForEach(0..<max(0, emptyStars), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.colorIconTabBar)
            }
        }
    }
}
