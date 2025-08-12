import SwiftUI

struct CategoryBtn: View {
    @Binding var selectCategory: Categories
    @Binding var isAscending: Bool
    var category: Categories
    
    var body: some View {
        Button {
            if selectCategory == category {
                isAscending.toggle()
            } else {
                selectCategory = category
                isAscending = true
            }
        } label: {
            HStack(spacing: 5) {
                Text(category.rawValue)
                    .foregroundStyle(selectCategory == category ? .white : .gray)
                    .font(.system(size: 14, weight: .bold))
                
                if selectCategory == category {
                    Image("Vector")
                        .rotationEffect(.degrees(isAscending ? 0 : 180))
                        .foregroundStyle(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 32)
            .background(
                Rectangle()
                    .foregroundStyle(selectCategory == category ? .colorPink : .white)
            )
        }
    }
}
