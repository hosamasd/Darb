//
//  ReviewStageScene.swift
//  Darb
//
//  Created by hosam on 02/11/2022.
//

import SwiftUI

struct ReviewRow:View {
    var x = ""
    
    var body: some View {
        VStack{
            
            HStack {
                Text(x)
                    .foregroundColor(ColorConstants.subTtitle2)
                
                Spacer()
            }
            .padding(.leading)
            
        }
        .padding()
        .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
    }
}

struct ReviewStageScene: View {
    @ObservedObject var vm:SchoolStageViewModel
    
    
    var body: some View {
        VStack(spacing:16) {
            
            FilterSection(name: "SCHOOL INFORMATION")
            
            
            FilterHeadSection(name: "School Name")
            
            ReviewRow(x: vm.selectedSchoolName.name)
            
            
            FilterHeadSection(name: "School Curriculum")
            
            ReviewRow(x: vm.selectedSchoolName.name)
            
            
            FilterHeadSection(name: "School Education Level ")
            
            ReviewRow(x: vm.selectedSchoolEducation.name)
            
            
            VStack{
                
                
                
                FilterSection(name: "STUDENT INFORMATION")
                
                FilterHeadSection(name: "First Name")
                
                ReviewRow(x: vm.firstName)
                
                FilterHeadSection(name: "Last Name")
                
                
                ReviewRow(x: vm.lastName)
                
                
                FilterHeadSection(name: "Birthdate")
                
                
                ReviewRow(x: vm.birthDate.description)
                
                FilterHeadSection(name: "National ID Number")
                
                VStack{
                    
                    ReviewRow(x: vm.NationalIDNumber)
                    
                    FilterHeadSection(name: "Birth Certificate")
                    
                    
                    ReviewRow(x: vm.uploadFileNameALLOWBirthC)
                    
                    FilterHeadSection(name: "Portrait Photo")
                    
                    
                    ReviewRow(x: vm.uploadFileNameALLOWPortraitPhoto)
                    
                    FilterHeadSection(name: "Health Report")
                    
                    
                    ReviewRow(x: vm.uploadFileNameALLOWHealthReport)
                    
                    
                    
                    
                }
            }
            .padding(.top)
        }
        .padding(.vertical)
    }
}

//struct ReviewStageScene_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewStageScene()
//    }
//}
