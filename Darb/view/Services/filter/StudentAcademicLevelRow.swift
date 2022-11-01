//
//  StudentAcademicLevelRow.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct StudentAcademicLevelModel {
    var id:Int = 0
    var name:String = ""
//    var isChecked:Bool = false
    
    
}

struct StudentAcademicLevelRow:View {
    var x = StudentAcademicLevelModel()
    @Binding var selected:StudentAcademicLevelModel
//    @ObservedObject var vm:SchoolExplorerSceneViewModel
    
    var body: some View {
        HStack {
            Label {
                Text(x.name)
                    .fontWeight(isConatins() ? .bold  : .none)
                    .foregroundColor(ColorConstants.subTtitle2)
            } icon: {
                Image(systemName: isConatins() ? "checkmark.square.fill" :  "square.fill")
                
                                .foregroundColor(!isConatins() ? Color.gray.opacity(0.2 ) : ColorConstants.servicesTit)
            }
          
            Spacer()
        }
        .padding(.horizontal,24)
      
    }
    
    
    
    
    func isConatins() -> Bool {
        selected.id==x.id
//        vm.selectedStudentAcademicLevels.id==x.id
    }
}
