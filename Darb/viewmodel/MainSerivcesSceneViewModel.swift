//
//  MainSerivcesSceneViewModel.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI


struct ServiceRowModel {
    var id:Int = 0
    var name,img :String
    
    
}


class MainSerivcesSceneViewModel:ObservableObject {
    @Published  var isLoading = false
    @Published var alertMsg=""
    @Published var alert=false
    
    @Published var isSchoolExplorer=false
    @Published var isSchoolEnrollment=false
    @Published var isSchoolTrasportationServices=false
    @Published var isStudentAttendanceRecord=true

    var servicesArray:[ServiceRowModel] = [
    
        .init(name: "The School Explorer", img: "Vector"),
        .init(id:1,name: "School Enrollment", img: "hugeIconEditorOutlineDescription"),
        .init(id:2,name: "School Trasportation Services", img: "hugeIconEducationOutlineBus"),
        .init(id:3,name: "Student Attendance Record", img: "cocoLineReport"),

    ]
    
}
