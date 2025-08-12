//  Created by Emilio

import SwiftUI

struct TopCategoriesView: View {
    @ObservedObject var viewModel: DoctorListViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ForEach(Categories.allCases) { type in
                        CategoryBtn(
                            selectCategory: $viewModel.selectedSortType,
                            isAscending: $viewModel.isAscending,
                            category: type
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 32)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        Color.clear
                            .frame(height: 0)
                            .id("top")
                        
                        ForEach(viewModel.filteredDoctors) { doctor in
                            DoctorCardView(path: $path, block: doctor)
                        }
                    }
                }
                .padding(.bottom, 10)
                .onChange(of: viewModel.selectedSortType) { _, _ in
                    proxy.scrollTo("top", anchor: .top)
                }
                .onChange(of: viewModel.isAscending) { _, _ in
                    proxy.scrollTo("top", anchor: .top)
                }
            }
            .onAppear {
                viewModel.loadDoctors()
            }
        }
    }
}
