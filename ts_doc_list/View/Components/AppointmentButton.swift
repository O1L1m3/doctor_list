//  Created by Emilio

import SwiftUI

struct AppointmentButton: View {
    var isAvailable: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(isAvailable ? "Записаться" :"Нет свободного расписания")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(isAvailable ? .white : .black)
                .frame(maxWidth: .infinity)
                .frame(height: 47)
                .background(isAvailable ? Color.colorPink : Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.bottom, 16)
    }
}
