//
//  Custom.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct Custom: View {
    @Binding var x:StudentAcademicLevelModel
    @Binding var isSchoolCurriculumShow:Bool
    @Binding var SchoolCurriculumArray:[StudentAcademicLevelModel]
    var body: some View {
//        ScrollView{
            VStack{
                
                VStack{
                    
                    HStack {
                        Text(x.name != "" ? x.name  : "Please Select")
                            .foregroundColor(ColorConstants.subTtitle2)
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                    }
                    
                }
                .padding()
                .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
                .onTapGesture {
                    withAnimation{
                        isSchoolCurriculumShow.toggle()
                    }
                }
                
                if isSchoolCurriculumShow {
                    VStack(spacing:8) {
                        ForEach(SchoolCurriculumArray,id: \.id){ x  in
                            StudentAcademicLevelRow(x: x, selected: $x)
                                .onTapGesture {
                                    withAnimation{
                                        self.x=x
                                        isSchoolCurriculumShow.toggle()
                                    }
                                }
                        }
                    }
                    .padding(.top,4)
                    .padding(.bottom,16)
                    
                }
            }
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
//        }

    }
}

