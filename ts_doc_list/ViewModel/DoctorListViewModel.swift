//  Created by Emilio

import Foundation

class DoctorListViewModel: ObservableObject {
    @Published var doctors: [Doctor] = []
    @Published var filteredDoctors: [Doctor] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var selectedSortType: Categories = .price {
        didSet {
            sortDoctors()
        }
    }
    @Published var isAscending: Bool = true {
        didSet {
            sortDoctors()
        }
    }
    @Published var searchText: String = "" {
        didSet {
            updateFilteredDoctors()
        }
    }

    private var allDoctors: [Doctor] = []
    private let dataService: DoctorDataServiceProtocol
    
    init(dataService: DoctorDataServiceProtocol = DoctorDataService()) {
        self.dataService = dataService
    }
    
    func loadDoctors() {
        isLoading = true
        do {
            let loadedDoctors = try dataService.loadDoctorsFromFile()
            self.allDoctors = loadedDoctors
            DispatchQueue.main.async {
                self.updateFilteredDoctors()
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Ошибка загрузки данных: \(error)"
                self.isLoading = false
            }
        }
    }

    func updateFilteredDoctors() {
        if searchText.isEmpty {
            self.filteredDoctors = allDoctors
        } else {
            let lowercasedSearchText = searchText.lowercased()
            self.filteredDoctors = allDoctors.filter { doctor in
                
                let hasMatchingSpecialization = doctor.specialization?.contains(where: { specialization in
                    specialization.name.lowercased().hasPrefix(lowercasedSearchText)
                }) ?? false

                let isGenericDoctor = (doctor.specialization?.isEmpty ?? true) && lowercasedSearchText == "врач"

                let hasMatchingName = doctor.firstName.lowercased().hasPrefix(lowercasedSearchText)
                                       || doctor.lastName.lowercased().hasPrefix(lowercasedSearchText)

                return hasMatchingSpecialization || isGenericDoctor || hasMatchingName
            }
        }
        sortDoctors()
    }

    func sortDoctors() {
        var sorted = filteredDoctors
        switch selectedSortType {
        case .price:
            sorted.sort { isAscending ? $0.sortablePrice < $1.sortablePrice : $0.sortablePrice > $1.sortablePrice }
        case .rating:
            sorted.sort { isAscending ? $0.rating > $1.rating : $0.rating < $1.rating }
        case .experience:
            sorted.sort { isAscending ? ($0.seniority ?? 0) < ($1.seniority ?? 0) : ($0.seniority ?? 0) > ($1.seniority ?? 0) }
        }
        self.filteredDoctors = sorted
    }
}
