//
//  SchoolStage.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SchoolStage: View {
    
    @ObservedObject var vm:SchoolStageViewModel
    
    var body: some View {
        VStack {
            
            
            VStack(spacing:16) {
                
                FilterHeadSection(name: "School Name")
                
                Custom(x: $vm.selectedSchoolName, isSchoolCurriculumShow: $vm.isShowSchoolName, SchoolCurriculumArray: $vm.SchoolCurriculumArray)
                
                FilterHeadSection(name: "School Curriculum")
                
                Custom(x: $vm.selectedSchoolCurriculum, isSchoolCurriculumShow: $vm.isShowSchoolCurriculum, SchoolCurriculumArray: $vm.SchoolCurriculumArray)
                
                FilterHeadSection(name: "School Education Level ")
                
                Custom(x: $vm.selectedSchoolEducation, isSchoolCurriculumShow: $vm.isShowSchoolEducation, SchoolCurriculumArray: $vm.SchoolEducationArray)
                
//                UploadBirthCertificate(vm: vm)
            }
        }
        
        .onChange(of: vm.selectedSchoolName.id) { newValue in
            print(newValue)
        }
        .onChange(of: vm.selectedSchoolCurriculum.id) { newValue in
            print(newValue)
        }
        .onChange(of: vm.selectedSchoolEducation.id) { newValue in
            print(newValue)
        }
    }
}

//struct SchoolStage_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolStage()
//    }
//}
