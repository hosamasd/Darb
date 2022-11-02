//
//  SchoolDetailScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct TabViewImages:View {
    @State var tab = 0

    var body: some View {
        
        TabView(selection:$tab) {
            
            ForEach(0...3,id: \.self) { i in
                Image("image 3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height:250)//200
                    .cornerRadius(16)
                    .tag(i)
                    .tabItem {
                        
                        Image(tab==i ? "Ellipse 324" : "Ellipse 327")

                    }
                
                  
            }
            
//            Color.red
//                .tag(0)
//                .tabItem {
//
//                    Image(tab==0 ? "Ellipse 324" : "Ellipse 327")
//
//                }
//
//            Color.blue
//                .tag(1)
//                .tabItem {
//
//                    Image(tab==1 ? "Ellipse 324" : "Ellipse 327")
//
//                }
//
//            Color.orange
//                .tag(2)
//                .tabItem {
//
//                    Image(tab==2 ? "Ellipse 324" : "Ellipse 327")
//
//                }
//
//            Color.green
//                .tag(3)
//                .tabItem {
//
//                    Image(tab==3 ? "Ellipse 324" : "Ellipse 327")
////                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
//
//                }
        }

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        
    }
}



struct SchoolDetailScene: View {
    @ObservedObject var vm:SchoolExplorerSceneViewModel
    
    var body: some View {
        VStack{
            
            HStack{
                
                Button {
                    withAnimation{
                      
                    }
                } label: {
                    Image("hambergermenu 1")
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
//            .padding(.bottom)
            .padding(.top,getSafeArea()?.top)
            .padding(.bottom,24)
            .padding(.horizontal,24)
            
            VStack{
                
               
                
                ScrollView(showsIndicators:false) {
                    
                    TabViewImages()
                        .frame(height:250)//getFrameSize().height/3)
                        .cornerRadius(16)

                        .overlay(
                            
                            HStack{
                                Image("Group 62")
                                    .onTapGesture {
                                        withAnimation{vm.isShowSelectedSchool.toggle()}
                                    }
                                Spacer()
                                Image("Group 65")
                                
                            }
                                .padding(.top,24)
                                .padding(.horizontal)
                            ,alignment:.top )
                        .padding(.bottom)
//                        .padding(.top)
//                        .padding(.horizontal,-16)
                    
                    VStack(spacing:16) {
                        
                        HStack {
                            Text("American International School - AISR")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack {
                            HStack(spacing:4) {
                                Image("Group 103")
                                
                                
                                Text("4  from 385 reviews ")
                                    .font(.system(size: 12))
                                    .fontWeight(.light)
                            }
                            Spacer()
                        }
                        
                        FilterSection(name: "INSTITUTION DESCRIPTION")
                            .padding(.bottom,-8)
                        
                        Text("Governed by a strategic Board of Trustees, the American International School-Riyadh is an independent, non-profit, co-educational learning community offering an enriched American curriculum with an intercultural perspective for students from pre-Kindergarten to grade 12.")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(ColorConstants.subTtitle2)
                        
                        FilterSection(name: "INSTITUTION STRUCTURE AND CURRICULUM")
                        
                        VStack(spacing:8) {
                            HStack {
                                Label {
                                    Text("Student Types:")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("users 2")
                                }
                                .font(.system(size: 12))
                                
                                Text("Girls & Boys")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                Spacer()
                                
                            }
                            
                            HStack {
                                Label {
                                    Text("Offered levels of education:")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("students")
                                }
                                .font(.system(size: 12))
                                
                                Text("KG, Primary, Lower Secondary, Upper Secondary")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                
                                Spacer()
                                
                            }
                            
                            HStack {
                                Label {
                                    Text("Student Types:")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("book 2")
                                }
                                .font(.system(size: 12))
                                
                                Text("Girls & Boys")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                Spacer()
                            }
                        }
                        
                        FilterSection(name: "INSTITUTION FACILITIES AND SERVICES")
                        
                        VStack(spacing:8) {
                            HStack {
                                Label {
                                    Text("Buildings::")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("book 2")
                                }
                                .font(.system(size: 12))
                                
                                Text("3 Multipurpose Buildings")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                Spacer()
                                
                            }
                            
                            HStack {
                                Label {
                                    Text("Classrooms:")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("desk")
                                }
                                .font(.system(size: 12))
                                
                                Text("130 classrooms")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                
                                Spacer()
                                
                            }
                            
                            HStack {
                                Label {
                                    Text("Labratories:")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("chemistry")
                                }
                                .font(.system(size: 12))
                                
                                Text("12 science, 3 technology, 5 STEM, & 1 Robotics Labratories")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                Spacer()
                            }
                            
                            HStack {
                                Label {
                                    Text("Transportation:")
                                    //                                .fontWeight(.semibold)
                                } icon: {
                                    Image("bus")
                                }
                                .font(.system(size: 12))
                                
                                Text("Bus Trasport Available")
                                    .font(.system(size: 10))
                                    .foregroundColor(ColorConstants.subTtitle2)
                                
                                Spacer()
                                
                            }
                        }
                        
                        FilterSection(name: "INSTITUTION LOCATION")
                        
                        
                        
                        //map view
                        
                        LastSection()//vm:vm)
                            .padding(.bottom,20)
                    }
                    .padding(.horizontal,32)
                }
                
            }
//        .padding(24)
//            .padding(.horizontal)
//        .padding(.top)
        .backgroundColor(Color.white)
        .clipShape(CustomCorners(corners: [.topLeft,.topRight], width: 32))
//
//        .padding(.top,getSafeArea()?.top)
        
        //            .padding(.top,40)
        
        
        
        
    }
    .backgroundColor(ColorConstants.servicesTit)
    .edgesIgnoringSafeArea(.all)
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    }
}

struct LastSection : View {
//    @ObservedObject var vm :
    var body: some View{
       
        VStack {
            
            VStack(spacing:8) {
                HStack {
                    Label {
                        Text("Prince Saud Ibn Abdullah Ibn Jalawi, Al Aarid, Riyadh 13332")
                    } icon: {
                        Image("Vectdor")
                    }
                    .font(.system(size: 12))
                    
                    Spacer()
                    
                }
                
            }
            
            GoogleMapView()
                .frame(height:150)
                .cornerRadius(12)
                .padding(.bottom)
            
            FilterSection(name: "INSTITUTION CONTACT INFORMATION")
            
            VStack(spacing:8) {
                HStack {
                    Label {
                        Text("Website:")
                        //                                .fontWeight(.semibold)
                    } icon: {
                        Image("globe")
                    }
                    .font(.system(size: 12))
                    
                    Text("www.aisr.org")
                        .font(.system(size: 10))
                        .foregroundColor(ColorConstants.subTtitle2)
                    Spacer()
                    
                }
                
                HStack {
                    Label {
                        Text("Mail:")
                        //                                .fontWeight(.semibold)
                    } icon: {
                        Image("🦆 icon _mail_")
                    }
                    .font(.system(size: 12))
                    
                    Text("inquiries@aisr.edu.sa")
                        .font(.system(size: 10))
                        .foregroundColor(ColorConstants.subTtitle2)
                    
                    Spacer()
                    
                }
                
                HStack {
                    Label {
                        Text("Phone:")
                        //                                .fontWeight(.semibold)
                    } icon: {
                        Image("Vector 2")
                    }
                    .font(.system(size: 12))
                    
                    Text("+966 (0)11 459 7500")
                        .font(.system(size: 10))
                        .foregroundColor(ColorConstants.subTtitle2)
                    Spacer()
                }
            }
            
            
            Button {
                withAnimation{
                    
                }
            } label: {
                RoundedRectangle(cornerRadius: 16)
                    .fill(ColorConstants.servicesTit)
                    .overlay (
                        Text("Apply Now")
                            .font(.system(size:20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    )
                    .frame(height:50)
            }
            .padding(.vertical)
            
        }
        
        
    }
}

struct SchoolDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetailScene(vm: SchoolExplorerSceneViewModel())
    }
}
