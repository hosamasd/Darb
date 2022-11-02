//
//  SchoolExplorerSceneViewModel.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

class SchoolExplorerSceneViewModel: ObservableObject {
    @Published var searchTxt=""
    
    @Published var schoolArrays:[SchoolModel]=[
        .init(name: "wmerican International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385),
        .init(name: "smerican International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385),
        
            .init(name: "dmerican International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385),
        
            .init(name: "fmerican International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385),
        
            .init(name: "gmerican International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385),
    ]
    @Published var selectedSchool=SchoolModel(name: "wmerican International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385)
    @Published var isShowSelectedSchool=false

    //filter
    @Published var isShowFilter=false
    @Published var isShowMaps=false

    //count
@Published var filterCount=1
    @Published var countGrade=0
    @Published var countCurricum=0
    @Published var count=0
    @Published var rangeCount=0

    @Published var isMale=true
    
    @Published var isstudentAcademicLevelsShow=false
    @Published var studentAcademicLevelsArray:[StudentAcademicLevelModel] = [
        .init(id:0,name: "Kindergarten"),
        .init(id:1,name: "Primary"),
            .init(id:2,name: "Lower Secondary"),
        .init(id:3,name: "Upper Secondary"),
 ]
    @Published var selectedStudentAcademicLevels:StudentAcademicLevelModel=StudentAcademicLevelModel(id: -1,name: "")

    //School Curriculum
    @Published var isSchoolCurriculumShow=false
    @Published var SchoolCurriculumArray:[StudentAcademicLevelModel] = [
        .init(id:0,name: "Saudi General Curriculum "),
        .init(id:1,name: "Islamic Curriculum"),
            .init(id:2,name: "American Curriculum"),
        .init(id:3,name: "British Curriculum"),
 ]
    @Published var selectedSchoolCurriculum:StudentAcademicLevelModel=StudentAcademicLevelModel(id: -1,name: "")
    
    //SchoolLocation
    @Published var isSchoolLocationShow=false
    @Published var SchoolLocationArray:[StudentAcademicLevelModel] = [
        .init(id:0,name: "Riyadh"),
        .init(id:1,name: "Jeddah"),
            .init(id:2,name: "Dammam"),
        .init(id:3,name: "Abha"),
 ]
    @Published var selectedSchoolLocation:StudentAcademicLevelModel=StudentAcademicLevelModel(id: -1,name: "")
    
    //distance
    @Published var sliderPosition: ClosedRange<Float> = 0...50
    @Published var lowerValue=0
    @Published var highetValue=50
    
    var ratingArray:[String]=[
         "Group 103", "Group 104", "Group 105", "Group 106",
    ]
    @Published var selectedRating=""
    @Published var isShowRating=false
}

