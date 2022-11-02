//
//  ChooseLocationScene.swift
//  Darb
//
//  Created by hosam on 02/11/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct ChooseLocationScene: View {
    
    @State var txt=""
    
//    @Binding var studentLocation:String

    @Binding var isShow:Bool
    var body: some View {
        
        GoogleMapView()
            .overlay(
                
                HStack{
                    
                    Button {
                        withAnimation{
                            isShow.toggle()
                        }
                    } label: {
                        Image("Group 62")
                    }
                    .offset(y:2)

                    
                    HStack{
                        
                        Image("Group 67")
                            .padding(.trailing,8)
                        
                        Divider()
                        
                        TextField("enter search txt", text: $txt)
                            .padding(.horizontal,6)
                    
                    }
                    .padding(.horizontal)
                    .backgroundColor(Color.white)

                    .frame(height:50)
                    .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
                }
                    .padding()
                    .padding(.top)
                ,alignment: .top)
        
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
            .onAppear{
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3){
                    // Load the last saved location
                    if let loadedLocation = UserDefaults.standard.data(forKey: "savedLocation"),
                       let decodedLocation = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(loadedLocation) as? CLLocation {
                        
                        print(decodedLocation.coordinate)
                        // Use the decodedLocation as you want
                    }
                }
                
            }
//        GoogleMapView()
    }
}

struct ChooseLocationScene_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLocationScene(isShow: .constant(false))
    }
}
