//
//  SchoolFilterScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI



struct SchoolFilterScene: View {
    @ObservedObject var vm : SchoolExplorerSceneViewModel
    @State var isChecked = false
    @State var sliderPosition: ClosedRange<Float> = 0...50
    
    
    
    
    
    
    var body: some View {
        VStack{
            VStack {
                
                HStack {
                    
                    Button {
                        withAnimation{
                            vm.filterCount=1
                            vm.isShowFilter.toggle()
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
                
                
                ScrollView(showsIndicators:false) {
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
                            
                        }
                        
                        
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal,4)
                }
                
                Button {
                    withAnimation{
                        self.vm.filterCount = vm.count+vm.countGrade+vm.countCurricum+vm.rangeCount+1
                        vm.isShowFilter.toggle()
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
                .padding(.bottom,30)
                
                
            }
            
            .padding(24)
            .padding(.top)
            .backgroundColor(Color.white)
            .clipShape(CustomCorners(corners: [.topLeft,.topRight], width: 32))
            
            .padding(.top,getSafeArea()?.top)
            
            //            .padding(.top,40)
            
            
            
            
        }
        .backgroundColor(ColorConstants.servicesTit)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        .onChange(of: vm.selectedSchoolCurriculum.id) { newValue in
            vm.countCurricum=1
//            vm.countCurricum += 1
//            self.vm.filterCount = vm.countCurricum == 1 ? vm.filterCount+1 : vm.filterCount
        }
        
        .onChange(of: vm.selectedStudentAcademicLevels.id) { newValue in
            vm.countGrade = 1
//            vm.countGrade += 1
//            self.vm.filterCount = vm.countGrade == 1 ? vm.filterCount+1 : vm.filterCount
        }
        //        .padding(.horizontal,24)
        
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
        SchoolFilterScene(vm: SchoolExplorerSceneViewModel())
    }
}
