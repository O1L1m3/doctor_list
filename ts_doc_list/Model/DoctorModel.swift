//  Created by Emilio

import Foundation

struct Doctor: Identifiable, Decodable, Hashable {

    let id: String
    let firstName: String
    let patronymic: String?
    let lastName: String
    let avatar: String?

    let specialization: [SpecializationItem]?
    let ratings: [RatingItem]?
    let higherEducation: [Education]
    let freeReceptionTime: [ReceptionSlot]
    let ratingsRating: Double?
    let seniority: Int?
    let scientificDegreeLabel: String?


    let textChatPrice: Double?
    let videoChatPrice: Double?
    let homePrice: Double?
    let hospitalPrice: Double?
    
    struct Education: Codable, Hashable {
        let id: Int
        let university: String
        let specialization: String
        let qualification: String
        let startDate: Int
        let endDate: Int
        let untilNow: Bool
        let isModerated: Bool
    }

    struct ReceptionSlot: Codable, Hashable {
        let time: Int
    }
    
    struct SpecializationItem: Decodable, Identifiable, Hashable {
        let id: Int
        let name: String
        let isModerated: Bool?

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case isModerated = "is_moderated"
        }
    }

    struct RatingItem: Decodable, Hashable {
        let id: Int
        let name: String
        let value: Double
    }
    
    var mainSpecialty: String {
        specialization?.first?.name ?? "Врач"
    }

    var seniorityString: String {
        if let seniority = seniority, seniority > 0 {
            return "стаж \(seniority) лет"
        }
        return "Опыт не указан"
    }

    var rating: Double {
        ratingsRating ?? ratings?.first(where: { $0.name == "Рейтинг" })?.value ?? 0.0
    }

    var sortablePrice: Double {
        videoChatPrice ?? textChatPrice ?? homePrice ?? hospitalPrice ?? 0.0
    }
}

struct DoctorPriceDestination: Hashable {
    let doctor: Doctor
}

enum Categories: String, CaseIterable, Identifiable {
    case price = "По цене"
    case experience = "По стажу"
    case rating = "По рейтингу"
    
    var id: String { self.rawValue }
}
