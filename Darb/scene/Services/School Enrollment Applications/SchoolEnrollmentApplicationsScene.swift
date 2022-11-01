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
    @StateObject var vm = SchoolEnrollmentApplicationsViewModel()
    @State var columnss = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)//12
    
    var body: some View {
        VStack{
            
            VStack{
                
                HStack{
                    
                    Button {
                        withAnimation{
                            
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
                
                
                
            
            
            ScrollView {
                
                
                
                VStack{
                    
                    LazyVGrid(columns: columnss, spacing: 20) {
                        
                        ForEach(vm.SchoolEnrollmentApplicationsArray) { x in
                            SchoolEnrollmentApplicationsRowView(x: x)
                        }
                        
                    }
                    
                }
             
                Spacer()
            }
            
            //            .padding(.top,40)
            
            
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
                .frame(height:50)
                .padding(.bottom,40)

            }
            .padding(24)
            .padding(.top)
            .backgroundColor(Color.white)
            .clipShape(CustomCorners(corners: [.topLeft,.topRight], width: 32))
            
            .padding(.top,getSafeArea()?.top)

            
        }
        .backgroundColor(ColorConstants.servicesTit)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SchoolEnrollmentApplicationsScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolEnrollmentApplicationsScene()
    }
}
