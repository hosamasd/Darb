//
//  SchoolTransportionServicesScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SchoolTransportionServicesSceneModel:Identifiable {
    var id = UUID().uuidString
    var name,forI,from,to:String
    
}




struct SchoolTransportionServicesScene: View {
    @StateObject var vm = SchoolTransportionServicesSceneiewModel()
    @State var columnss = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)//12
    
    
    var body: some View {
        VStack{
            
            HStack {
                Text("School Trasportation Services")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Divider()
                .padding(.bottom)
            //            .padding(.top,-8)
            
            
            
            
            
            ScrollView(showsIndicators:false) {
                
                ZStack {
                    
                    if vm.isCreateNewwAPP {
                        SchoolSubmitApplication(vm:vm)
                            .transition(.move(edge: .leading))
                        
                    }
                    else {
                        
                        VStack{
                            
                            ZStack{
                                //empty array
                                
                                if vm.SchoolTransportionServicesSceneiewArray.count == 0 {
                                    
                                    VStack{
                                        
                                        Text("No School Tranportation Sevices Registered.")
                                            .font(.system(size: 12))
                                            .foregroundColor(ColorConstants.subTtitle2)
                                        
                                        Spacer()
                                    }
                                    .padding(.top,20)
                                    
                                }else {
                                    
                                    LazyVGrid(columns: columnss, spacing: 20) {
                                        
                                        ForEach(vm.SchoolTransportionServicesSceneiewArray) { x in
                                            SchoolTransportionServicesRowView(x: x)
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                        .transition(.move(edge: .leading))
                    }
                    
                }
                Spacer()
            }
            .padding(.vertical)
            
            //            .padding(.top,40)
            
            
            ZStack {
                
                if !vm.isCreateNewwAPP {
                    
                    Button {
                        withAnimation{vm.isCreateNewwAPP.toggle()}
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
                    
                    
                }else {
                    
                    
                    
                    
                    Button {
                        withAnimation{
                            addApp()
                            vm.isCreateNewwAPP.toggle()
                            //                            vm.isFirstStage=true
                        }
                    } label: {
                        
                        
                        
                        
                        RoundedRectangle(cornerRadius: 12)
                            .fill(ColorConstants.servicesTit)
                            .overlay(
                                Label(title: {
                                    Text("Submit Application")
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
            //                .padding(.bottom,40)
            .padding(.bottom,getSafeArea()!.bottom+40)
            
            
        }
        .padding(.horizontal,8)
    }
    
    func addApp()  {
        self.vm.SchoolTransportionServicesSceneiewArray =
        [
            .init(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh"),
            .init(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh"),
            .init(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh")
        ]
    }
}

struct SchoolTransportionServicesScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolTransportionServicesScene()
    }
}
