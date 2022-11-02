//
//  SchoolSubmitApplication.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

class SchoolTransportionServicesSceneiewModel:ObservableObject {
    @Published var SchoolTransportionServicesSceneiewArray:[SchoolTransportionServicesSceneModel] = [
//        .init(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh"),
//        .init(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh"),
//        .init(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh")
        
    ]
    @Published var studentName=""
    @Published var studentGrad=""
    @Published var studentLocation=""

    @Published var isCreateNewwAPP=false

    @Published var isShowMaps=false
}

struct SchoolSubmitApplication: View {
    @ObservedObject var vm : SchoolTransportionServicesSceneiewModel

    var body: some View {
        VStack {
        
            FilterSection(name: "STUDENT INFORMATION")
                .padding(.vertical)

            FilterHeadSection(name: "Student Name")

            
            VStack {
                
                TextField("Student Name", text: $vm.studentName)
                    .padding(.leading)
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
            FilterHeadSection(name: "Student Grade")

            VStack {
                
                TextField("Student Grade", text: $vm.studentGrad)
                    .padding(.leading)
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)

            FilterSection(name: "TRANSPORTATION INFORMATION")
                .padding(.vertical)
            
            FilterHeadSection(name: "Home Location")

            VStack {
                
                HStack {
                    Text("Enter Location")//, text: $vm.studentGrad)
                        .padding(.leading)
                    Spacer()
                    Button {
                        withAnimation{vm.isShowMaps.toggle()}
                    } label: {
                        
                        Label {
                            Text("Maps")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                           
                        } icon: {
                            Image("Vector 4")
                                .foregroundColor(Color.white)
                        }

                        
                      
                            .padding(.vertical,8)
                            .padding(.horizontal,16)
                            .backgroundColor(ColorConstants.servicesTit)
                            .clipShape(Capsule())

                    }

                }
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
        }
        
        .background(EmptyView()
            .fullScreenCover(isPresented: $vm.isShowMaps, content: {
                ChooseLocationScene(isShow: $vm.isShowMaps)

            })
                    )
    }
}

struct SchoolSubmitApplication_Previews: PreviewProvider {
    static var previews: some View {
        SchoolSubmitApplication(vm: SchoolTransportionServicesSceneiewModel())
    }
}
