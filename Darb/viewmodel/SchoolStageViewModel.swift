//
//  SchoolStageViewModel.swift
//  Darb
//
//  Created by hosam on 02/11/2022.
//

import SwiftUI

class SchoolStageViewModel: ObservableObject {
    
    @Published var SchoolEnrollmentApplicationsArray:[SchoolEnrollmentApplicationsModel] = [
        .init(name: "American International School - AISR", secName: "Al Aarid, Riyadh"),
        .init(name: "American International ", secName: "Al Khuzama, Riyadh"),
        
    ]
    
    //SchoolName
    @Published var isShowSchoolName=false
    @Published var SchoolNamerray:[StudentAcademicLevelModel] = [
        .init(id:0,name: "Misk Schools "),
        .init(id:1,name: "American International School"),
        .init(id:2,name: "Najd National School"),
        .init(id:3,name: "Riyadh Schools"),
    ]
    @Published var selectedSchoolName:StudentAcademicLevelModel=StudentAcademicLevelModel(id: -1,name: "")
    
    //SchoolCurriculum
    @Published var isShowSchoolCurriculum=false
    @Published var SchoolCurriculumArray:[StudentAcademicLevelModel] = [
        .init(id:0,name: "Saudi General Curriculum  "),
        .init(id:1,name: "Islamic Curriculum"),
        .init(id:2,name: "American Curriculum"),
        .init(id:3,name: "British Curriculum"),
    ]
    @Published var selectedSchoolCurriculum:StudentAcademicLevelModel=StudentAcademicLevelModel(id: -1,name: "")
    
    //SchoolEducation Level
    @Published var isShowSchoolEducation=false
    @Published var SchoolEducationArray:[StudentAcademicLevelModel] = [
        .init(id:0,name: "Kindergarten  "),
        .init(id:1,name: "Primary"),
        .init(id:2,name: "Lower Secondary"),
        .init(id:3,name: "Upper Secondary"),
    ]
    @Published var selectedSchoolEducation:StudentAcademicLevelModel=StudentAcademicLevelModel(id: -1,name: "")
    
    //student satge
    @Published var firstName=""
    @Published var lastName=""
    @Published var NationalIDNumber=""
    @Published var birthDate=Date()
    
    @Published var isSecondStage=false
    @Published var isThirdStage=false
    @Published var isFirstStage=false
    
    //upload
    @Published var isShowBirthCertificate=false
    @Published  var imageALLOWBirthC: Image? = Image("seen")
    @Published var uploadFileNameALLOWBirthC=""

    @Published var isShowPortraitPhoto=false
    @Published  var imageALLOWPortraitPhoto: Image? = Image("seen")
    @Published var uploadFileNameALLOWPortraitPhoto=""
    
    @Published var isShowHealthReport=false
    @Published  var imageALLOWHealthReport: Image? = Image("seen")
    @Published var uploadFileNameALLOWHealthReport=""
    
    @Published  var uploadedFiledALLOW : Data? = nil
    
    @Published  var shouldPresentImagePicker = false
    @Published  var shouldPresentCamera = false
    
    @Published var mainSheets=false
    @Published  var shouldPresentActionScheet = false

    @Published var mainSheets1=false
    @Published  var shouldPresentActionScheet1 = false
    
    @Published var mainSheets2=false
    @Published  var shouldPresentActionScheet2 = false
}
