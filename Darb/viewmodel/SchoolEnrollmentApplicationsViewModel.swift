//
//  SchoolEnrollmentApplicationsViewModel.swift
//  Darb
//
//  Created by hosam on 02/11/2022.
//

import SwiftUI

struct SchoolEnrollmentApplicationsModel:Identifiable {
    var id = UUID().uuidString
    var name,secName:String
    var img = "image 3"
    var isProceess = true
}


class SchoolEnrollmentApplicationsViewModel:ObservableObject {
    @Published var SchoolEnrollmentApplicationsArray:[SchoolEnrollmentApplicationsModel] = [
        .init(name: "American International School - AISR", secName: "Al Aarid, Riyadh"),
        .init(name: "American International ", secName: "Al Khuzama, Riyadh"),
        
    ]
    
}
