//  Created by Emilio

import SwiftUI

struct TopContentView: View {
    var body: some View {
        HStack(spacing: 0){
            
            Spacer()
            
            Text("Педиатры")
                .font(.system(size: 20, weight: .medium))
            
            Spacer()
            
            Rectangle()
                .frame(width: 12, height: 21)
                .foregroundColor(.clear)
        }
    }
}
