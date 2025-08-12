//  Created by Emilio

import SwiftUI

struct DoctorHomeView: View {
    @StateObject var viewModel = DoctorListViewModel()
    @State var selectCategory: Categories = .price
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 16) {
                    
                    TopContentView()
                    TopSearchView(path: $path, viewModel: viewModel)
                    TopCategoriesView(viewModel: viewModel, path: $path)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal,16)
            .background(.colorBG)
            .zIndex(1)
            .navigationDestination(for: Doctor.self) { doctor in
                ProfileDoctorView(block: doctor, path: $path)
            }
            .navigationDestination(for: DoctorPriceDestination.self) { destination in
                DoctorPriceView(block: destination.doctor)
            }
        }
    }
}
