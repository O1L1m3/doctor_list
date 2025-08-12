//  Created by Emilio

import Foundation

struct DoctorListResponse: Decodable {
    let data: DoctorsData
    
    struct DoctorsData: Decodable {
        let users: [Doctor]
    }
}
