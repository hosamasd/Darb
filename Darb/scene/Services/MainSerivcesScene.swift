//
//  MainSerivcesScene.swift
//  Darb
//
//  Created by hosam on 31/10/2022.
//

import SwiftUI

struct MainSerivcesScene: View {
    @StateObject var vm = MainSerivcesSceneViewModel()
    
    var body: some View {
        VStack{
            
            VStack{
                
                HStack{
                    
                    Button {
                        withAnimation{
                            if vm.isSchoolExplorer {
                                vm.isSchoolExplorer=false
                            }else if vm.isSchoolEnrollment {
                                vm.isSchoolEnrollment=false
                            }else if vm.isSchoolTrasportationServices {
                                vm.isSchoolTrasportationServices=false
                            }else if vm.isStudentAttendanceRecord {
                                vm.isStudentAttendanceRecord=false
                            }
                        }
                    } label: {
                        Image("hambergermenu")
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation{
                            
                        }
                    } label: {
                        Image("darb logo 1")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .foregroundColor(.black)
                    }
                    .padding(.trailing)
                    
                }
                .padding(.bottom,24)
                
                ZStack {
                    
                    if vm.isSchoolExplorer {
                        SchoolExplorerScene()
                            .transition(.move(edge: .top))
                    }
                   else if vm.isSchoolEnrollment {
                        SchoolEnrollmentApplicationsScene()
                            .transition(.move(edge: .bottom))
                    }
                    else  if vm.isSchoolTrasportationServices {
                        SchoolTransportionServicesScene()
                            .transition(.move(edge: .trailing))
                    }
                    else  if vm.isStudentAttendanceRecord {
                        StudentAttendanceRecordScene()
                            .padding(.top)
                            .transition(.move(edge: .top))
                    }
                    else {
                        
                        
                        
                        
                        VStack{
                            
                            HStack {
                                Text("Services")
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.servicesTit)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            
                            Divider()
                                .padding(.bottom)
                                .padding(.top,-8)
                            
                            ScrollView(isSmallDevice() ? .vertical : .init() ,showsIndicators:false){
                                VStack {
                                    
                                    ForEach(vm.servicesArray,id: \.id) { x  in
                                        ServiceRow(x: x)
                                            .padding(.vertical,12)
                                            .onTapGesture {
                                                withAnimation{
                                                    checks(x:x)
                                                }
                                            }
                                        
                                    }
                                    
                                    
                                }
                            }
                            .padding(.bottom,isSmallDevice() ? 30 : 0)
                            Spacer()
                        }
                        .padding(.horizontal,8)
                        
                    }
                    
                }
            }
            .padding(24)
            
            .padding(.top)//,isSmallDevice() ? 0 : 8)
            .backgroundColor(Color.white)
            .clipShape(CustomCorners(corners: [.topLeft,.topRight], width: 32))
            
            .padding(.top,getSafeArea()?.top)
//            .offset(y:isSmallDevice() ? 16 : 0)
            .padding(.top,isSmallDevice() ? 16 : 0)

            //            .padding(.top,40)
            
            
            
            
        }
        .backgroundColor(ColorConstants.servicesTit)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    func checks(x:ServiceRowModel)  {
        switch x.id {
        case 0:
            vm.isSchoolExplorer.toggle()
        case 1:
            vm.isSchoolEnrollment.toggle()
        case 2:
            vm.isSchoolTrasportationServices.toggle()
        default:
            vm.isStudentAttendanceRecord.toggle()
        }
    }
}

struct MainSersivcesScene_Previews: PreviewProvider {
    static var previews: some View {
        MainSerivcesScene()
    }
}
