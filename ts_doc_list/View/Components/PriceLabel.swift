//  Created by Emilio

import SwiftUI

struct PriceLabel: View {
    let price: Double

    var body: some View {
        if price > 0 {
            Text("от \(Int(price)) ₽")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.black)
        } else {
            Text("Цена не указана")
                .font(.system(size: 15))
                .foregroundColor(.gray)
        }
    }
}



