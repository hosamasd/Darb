//
//  SchoolEnrollmentApplicationsScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SchoolEnrollmentApplicationsModel:Identifiable {
    var id = UUID().uuidString
    var name,secName:String
    var img = "image 3"
    var isProceess = true
}

class SchoolEnrollmentApplicationsViewModel:ObservableObject {
    @Published var SchoolEnrollmentApplicationsArray:[SchoolEnrollmentApplicationsModel] = [
        .init(name: "American International School - AISR", secName: "Al Aarid, Riyadh"),
        .init(name: "American International ", secName: "Al Khuzama, Riyadh"),
        
    ]
    
}


struct SchoolEnrollmentApplicationsScene: View {
    @StateObject var vm = SchoolStageViewModel()
    @State var columnss = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)//12
    
    var body: some View {
        VStack{
            
            VStack{
                
                
                HStack {
                    Text("School Enrollment Applications")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                Divider()
                    .padding(.bottom)
                //            .padding(.top,-8)
                
                
                if vm.isFirstStage || vm.isSecondStage || vm.isThirdStage {
                    
                    HStack(spacing:0) {
                        
                        Circle()
                            .fill(ColorConstants.servicesTit)
                            .frame(width:30)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(vm.isSecondStage || vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
                            .frame(height:5)
                        
                        Circle()
                            .fill(vm.isSecondStage || vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
                            .frame(width:30)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
                            .frame(height:5)
                        
                        Circle()
                            .fill(vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)                            .frame(width:30)
                    }
                        
                        HStack {
                            Text("School")
                                .foregroundColor(Color.black.opacity(0.8))
                        Spacer()
                            
                            Text("Student")
                                .foregroundColor(Color.black.opacity(0.8))
                        Spacer()
                            
                            Text("Review")
                                .foregroundColor(Color.black.opacity(0.8))
                        
                            
                            
                        }
                        .padding(.bottom)

//                        VStack {
//                            Circle()
//                                .fill(ColorConstants.servicesTit)
//                                .frame(width:30)
//
//                            Text("School")
//                                .foregroundColor(Color.black.opacity(0.8))
//                        }
//                        VStack {
//
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(vm.isSecondStage || vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
//                                .frame(height:5)
//
//                            Text("School")
//                                .foregroundColor( Color.black.opacity(0.0))
//                        }
//                        VStack {
//                            Circle()
//                                .fill(vm.isSecondStage || vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
//                                .frame(width:30)
//                            Text("Student")
//                                .foregroundColor(Color.black.opacity(0.8))
//
//                        }
//                        VStack {
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
//                                .frame(height:5)
//                            Text("Student")
//                                .foregroundColor(Color.black.opacity(0.0))
//                        }
//                        VStack {
//
//                            Circle()
//                                .fill(vm.isThirdStage ? ColorConstants.servicesTit : ColorConstants.starEmpt)
//                                .frame(width:30)
//                            Text("Review")
//                                .foregroundColor(Color.black.opacity(0.8))
//
//                        }
//                    }
                    
                }
                
                
                ScrollView(showsIndicators:false) {

                    ZStack {
                        
                        if vm.isFirstStage {
                            
                            SchoolStage(vm: vm)
                                .transition(.move(edge: .bottom))
                            
                            
                        }else if vm.isSecondStage {
                            StudentStage(vm: vm)
                                .transition(.move(edge: .leading))
                            
                            
                        }else if vm.isThirdStage {
                            ReviewStageScene(vm: vm)
                                .transition(.move(edge: .trailing))
                            
                            
                        }else {
                            
                            VStack{
                                
                                ZStack {
                                    
                                    //empty array
                                    
                                    if vm.SchoolEnrollmentApplicationsArray.count == 0 {
                                        
                                        VStack{
                                            
                                            Text("No School Tranportation Sevices Registered.")
                                                .font(.system(size: 12))
                                                .foregroundColor(ColorConstants.subTtitle2)
                                            
                                            Spacer()
                                        }
                                        .padding(.top,20)
                                        
                                    }else {
                                        
                                        LazyVGrid(columns: columnss, spacing: 20) {
                                            
                                            ForEach(vm.SchoolEnrollmentApplicationsArray) { x in
                                                SchoolEnrollmentApplicationsRowView(x: x)
                                            }
                                            
                                        }
                                    }
                                }
                                
                            }
                            .transition(.move(edge: .top))
                        }
                        
                        
                        
                    }
                    
                    //                VStack{
                    //
                    //                    LazyVGrid(columns: columnss, spacing: 20) {
                    //
                    //                        ForEach(vm.SchoolEnrollmentApplicationsArray) { x in
                    //                            SchoolEnrollmentApplicationsRowView(x: x)
                    //                        }
                    //
                    //                    }
                    //
                    //                }
                    
                    Spacer()
                }
                .padding(.bottom)
                .padding(.horizontal,8)
                
                //            .padding(.top,40)
                
                ZStack {
                    if vm.isFirstStage || vm.isSecondStage || vm.isThirdStage {
                        Button {
                            withAnimation{
                                if vm.isFirstStage {
                                    if  !checkFirst() {   vm.isSecondStage=true
                                        vm.isFirstStage = false
                                    } else {()}
                                }else  if vm.isSecondStage {
                                    if  !checkSecond() {   vm.isThirdStage = true
                                        vm.isSecondStage = false
                                    } else {()}
                                }else {
                                    vm.isThirdStage = false
                                    
                                }
                            }
                        } label: {
                            
                            
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(ColorConstants.servicesTit)
                                .overlay(
                                    HStack{
                                        Spacer()
                                        Text(getTitle())
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color.white)
                                        
                                    }
                                        .padding(.horizontal)
                                )
                        }
                        .frame(height:50)
                        .transition(.move(edge: .trailing))
                        //                        .disabled()
                        
                    }else {
                        
                        
                        
                        Button {
                            withAnimation{
                                vm.isFirstStage=true
                            }
                        } label: {
                            
                            
                            
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(ColorConstants.servicesTit)
                                .overlay(
                                    Label(title: {
                                        Text("New Application")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color.white)
                                    }, icon: {
                                        Image("addcircle")
                                        
                                    })
                                )
                        }
                        .transition(.move(edge: .leading))
                        
                    }
                }
                .frame(height:50)
//                .padding(.top,20)
                .padding(.bottom,getSafeArea()!.bottom+40)
                
            }
//            .padding(.horizontal,8)
//            .padding(24)
//            .padding(.top)
//            .backgroundColor(Color.white)
//            .clipShape(CustomCorners(corners: [.topLeft,.topRight], width: 32))
//            
//            .padding(.top,getSafeArea()?.top)
            
            
        }
        .padding(.horizontal,8)
        
        
      
//        .backgroundColor(ColorConstants.servicesTit)
//        .edgesIgnoringSafeArea(.all)
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
    
    func getTitle() -> String {
        vm.isFirstStage || vm.isSecondStage ? "Continue" : "Submit Application"
    }
    
    func checkFirst() -> Bool {
        vm.selectedSchoolName.id != -1 && vm.selectedSchoolCurriculum.id != -1 && vm.selectedSchoolEducation.id != -1
    }
    
    func checkSecond() -> Bool {
        vm.firstName != "" && vm.lastName != "" && vm.NationalIDNumber != "" && vm.uploadFileNameALLOWBirthC != "" &&  vm.uploadFileNameALLOWPortraitPhoto != "" && vm.uploadFileNameALLOWHealthReport != ""
        
    }
}

struct SchoolEnrollmentApplicationsScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolEnrollmentApplicationsScene()
    }
}
