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
            
            
            
            
            
            ScrollView {
                
                
                
                VStack{
                    
                    LazyVGrid(columns: columnss, spacing: 20) {
                        
                        ForEach(vm.SchoolTransportionServicesSceneiewArray) { x in
                            SchoolTransportionServicesRowView(x: x)
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
        
    }
}

struct SchoolTransportionServicesScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolTransportionServicesScene()
    }
}
