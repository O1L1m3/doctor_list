//  Created by Emilio

import Foundation

protocol DoctorDataServiceProtocol {
    func loadDoctorsFromFile() throws -> [Doctor]
}

class DoctorDataService: DoctorDataServiceProtocol {
    func loadDoctorsFromFile() throws -> [Doctor] {
        guard let url = Bundle.main.url(forResource: "test", withExtension: "json")
        else {
            throw NSError(domain: "DoctorDataService", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON файл не найден"])
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode(DoctorListResponse.self, from: data)
        return decoded.data.users
    }
}

