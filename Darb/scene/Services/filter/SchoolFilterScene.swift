//
//  SchoolFilterScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI



struct SchoolFilterScene: View {
    @StateObject var vm = SchoolExplorerSceneViewModel()
    @State var isChecked = false
    @State var sliderPosition: ClosedRange<Float> = 0...50
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button {
                    withAnimation{
                        
                    }
                } label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20))
                        .foregroundColor(ColorConstants.servicesTit)
                    
                    
                }
                
                Spacer()
                
                Text("Filter")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
                
                Button {
                    withAnimation{
                        
                    }
                } label: {
                    Text("Reset")
                        .font(.system(size: 20))
                        .foregroundColor(ColorConstants.servicesTit)
                    
                    
                }
                
            }
            
            
            ScrollView {
                VStack(spacing:16) {
                    
                    FilterSection()
                    
                    
                    
                    FilterHeadSection()
                    
                    //is male
                    HStack(spacing:16) {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.white)
                            .frame(height:50)
                            .overlay(
                                
                                
                                Label {
                                    Text("Female")
                                        .fontWeight(!vm.isMale ? .bold  : .none)
                                    
                                        .foregroundColor(ColorConstants.subTtitle2)
                                } icon: {
                                    Image(systemName: isFemale())
                                        .foregroundColor(vm.isMale ? Color.gray.opacity(0.2 ) : ColorConstants.servicesTit)
                                }
                            )
                            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
                            .onTapGesture {
                                withAnimation{
                                    isChecked=true
                                    vm.isMale=false
                                    
                                }
                            }
                        
                        
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.white)
                            .frame(height:50)
                            .overlay(
                                
                                
                                Label {
                                    Text("Male")
                                        .fontWeight(vm.isMale ? .bold  : .none)
                                        .foregroundColor(ColorConstants.subTtitle2)
                                } icon: {
                                    Image(systemName: isMale())
                                        .foregroundColor(!vm.isMale ? Color.gray.opacity(0.2 ): ColorConstants.servicesTit)
                                    
                                }
                            )
                            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
                            .onTapGesture {
                                withAnimation{
                                    isChecked=false
                                    vm.isMale=true
                                }
                            }
                        
                    }
                    
                    
                    FilterHeadSection(name: "Student Academic Grade")
                    
                 
                    
                    Custom(x: $vm.selectedStudentAcademicLevels, isSchoolCurriculumShow: $vm.isstudentAcademicLevelsShow, SchoolCurriculumArray: $vm.studentAcademicLevelsArray)

                
                    FilterSection(name: "SCHOOL FILTERS")
                    
                    FilterHeadSection(name: "School Curriculum")

                    
                    Custom(x: $vm.selectedSchoolCurriculum, isSchoolCurriculumShow: $vm.isSchoolCurriculumShow, SchoolCurriculumArray: $vm.SchoolCurriculumArray)

                    
                    VStack {
                        FilterHeadSection(name: "School Rating")

                        
                        CustomRatingView(vm: vm)
                   
                    
                        SliderRange(vm:vm)
                  

                    
                    Button {
                        withAnimation{
                            
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(ColorConstants.servicesTit)
                            .overlay (
                                Text("Apply Filter")
                                    .font(.system(size:20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                            )
                            .frame(height:50)
                    }
                        
                    }
                    

                    
                    
                }
                .padding(.vertical)
                .padding(.horizontal,4)
            }
            
            
        }
        .padding(.horizontal,24)
       
    }
    
    func isFemale() -> String {
        isChecked  ? "checkmark.square.fill" :  "square.fill"

//        vm.isMale || isChecked  ? "checkmark.square.fill" :  "square.fill"
    }
    
    func isMale() -> String {
        vm.isMale  ? "checkmark.square.fill" :  "square.fill"

//        vm.isMale || isChecked  ? "checkmark.square.fill" :  "square.fill"
    }
}

struct SchoolFilterScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolFilterScene()
    }
}
