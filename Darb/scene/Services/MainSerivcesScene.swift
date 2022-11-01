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
                    
                    
                    VStack {
                        
                        ForEach(vm.servicesArray,id: \.id) { x  in
                            ServiceRow(x: x)
                                .padding(.vertical,12)
                            
                        }
                        
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal,8)
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
        
    }
}

struct MainSersivcesScene_Previews: PreviewProvider {
    static var previews: some View {
        MainSerivcesScene()
    }
}
