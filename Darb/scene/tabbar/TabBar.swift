//
//  TabBar.swift
//  Blue Bird
//
//  Created by hosam on 20/07/2022.
//

import SwiftUI

struct TabBar:View {
    
    @Binding var index:Int
    
    var body: some View {
        
        HStack (spacing:0){
            
//            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=0}}, label: {
                
                VStack(spacing:2) {
                    Image( index==0 ? "Vector" : "Vector")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text(LocalizedStringKey("Home"))
                                                .fontWeight(index==0 ? .bold : .none)
                        .foregroundColor(index==0 ?  ColorConstants.servicesTit : Color.black.opacity(0.3))
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=1}}, label: {
                VStack(spacing:2) {

                    Image(index==1 ? "book1" : "book1")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text(LocalizedStringKey("Classes"))
                      
                        .fontWeight(index==1 ? .bold : .none)

                    .foregroundColor(index==1 ?  ColorConstants.servicesTit : Color.black.opacity(0.3))
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=2}}, label: {
                VStack(spacing:2) {

                    Image(index==2 ? "grid1" : "grid1")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text(LocalizedStringKey("Services"))
                                           .fontWeight(index==2 ? .bold : .none)

                    .foregroundColor(index==2 ?  ColorConstants.servicesTit : Color.black.opacity(0.3))
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=3}}, label: {
                VStack(spacing:2) {

                    Image(index==3 ? "Vectors" :"Vectors")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(LocalizedStringKey("Chats"))
                
                                         .fontWeight(index==3 ? .bold : .none)

                    .foregroundColor(index==3 ? ColorConstants.servicesTit : Color.black.opacity(0.3))
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {withAnimation{index=4}}, label: {
                VStack(spacing:2) {

                    Image(index==4 ? "Vector 3" : "Vector 3")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(LocalizedStringKey("Profile"))
                
                                          .fontWeight(index==4 ? .bold : .none)

                    .foregroundColor(index==4 ? ColorConstants.servicesTit : Color.black.opacity(0.3))
                }
            })
            
//            Spacer(minLength: 0)
            
        }
        .padding(.horizontal,16)//25
        .padding(.top,10)
        .frame(height:60)
//        .background(Color.red)
//        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
        
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 20)
//
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
        
       
      
//        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: 5)

       

        //        .shadow(color: Color.gray.opacity(0.6), radius: 3)
//        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)

        
        
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        SHomeTabBar()
    }
}
