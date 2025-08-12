//  Created by Emilio

import SwiftUI

struct TopSearchView: View {
    
    @Binding var path: NavigationPath
    @ObservedObject var viewModel: DoctorListViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
            
            TextField("Поиск", text: $viewModel.searchText)
                .font(.system(size: 16))
                .foregroundStyle(.gray)
                .frame(height: 50)
        }
        .padding(.leading, 16)
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        }
    }
}
