//
//  SchoolStage.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SchoolStage: View {
    
    @StateObject var vm=SchoolStageViewModel()
    
    var body: some View {
        VStack {
            
            HStack(spacing:-13) {
                VStack {
                    Circle()
                        .fill(ColorConstants.servicesTit)
                        .frame(width:30)
                    
                    Text("School")
                        .foregroundColor(Color.black.opacity(0.8))
                }
                VStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(ColorConstants.starEmpt)
                        .frame(height:5)
                    
                    Text("Student")
                        .foregroundColor(Color.black.opacity(0.0))
                }
                VStack {
                    Circle()
                        .fill(ColorConstants.servicesTit)
                        .frame(width:30)
                    Text("Student")
                        .foregroundColor(Color.black.opacity(0.8))
                    
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(ColorConstants.starEmpt)
                        .frame(height:5)
                    Text("School")
                        .foregroundColor(Color.black.opacity(0.0))
                }
                VStack {
                    
                    Circle()
                        .fill(ColorConstants.servicesTit)
                        .frame(width:30)
                    Text("Review")
                        .foregroundColor(Color.black.opacity(0.8))
                    
                }
            }
            
            VStack(spacing:16) {
                
                FilterHeadSection(name: "School Name")
                
                Custom(x: $vm.selectedSchoolName, isSchoolCurriculumShow: $vm.isShowSchoolName, SchoolCurriculumArray: $vm.SchoolCurriculumArray)
                
                FilterHeadSection(name: "School Curriculum")
                
                Custom(x: $vm.selectedSchoolName, isSchoolCurriculumShow: $vm.isShowSchoolName, SchoolCurriculumArray: $vm.SchoolCurriculumArray)
                
                FilterHeadSection(name: "School Education Level ")
                
                Custom(x: $vm.selectedSchoolEducation, isSchoolCurriculumShow: $vm.isShowSchoolEducation, SchoolCurriculumArray: $vm.SchoolEducationArray)
                
                UploadBirthCertificate(vm: vm)
            }
        }
    }
}

struct SchoolStage_Previews: PreviewProvider {
    static var previews: some View {
        SchoolStage()
    }
}
