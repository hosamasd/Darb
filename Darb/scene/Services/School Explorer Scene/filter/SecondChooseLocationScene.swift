//
//  SecondChooseLocationScene.swift
//  Darb
//
//  Created by hosam on 02/11/2022.
//

import SwiftUI

struct LocationRow : View {
    var x = SchoolModel(name: "American International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385)
    
    var body: some View {
        HStack(spacing:12){
            
            
            
            Image(x.img)
                .resizable()
                .frame(width:getFrameSize().width/2.5,height: 150)
                .cornerRadius(12)
            
            VStack{
                
                VStack (alignment: .leading){
                    Text(x.name)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    
                    Text(x.secName)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.top,-12)
                    
                    Text(x.place)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray.opacity(0.6))
                        .padding(.top,-4)
                }
                
                //                Spacer()
                
                VStack {
                    
                    FiveStarView(rating: 4.5)
                        .frame(minWidth: 1, idealWidth: 20, maxWidth: 20, minHeight: 1, idealHeight: 20, maxHeight: 20)//, alignment: .center)
                        .padding(.leading,-8)
                        .padding(.bottom,4)
                    
                    VStack (alignment: .leading){
                        
                        HStack {
                            Text(String(format: "%.1f", x.rating))
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                            
                            Text("from \(x.reviews) reviews")
                                .font(.system(size: 14))
                            
                                .foregroundColor(Color.gray.opacity(0.6))
                        }
                    }
                }
                .padding(.leading,-16)
                .padding(.top,4)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        
        .background(
            RoundedRectangle(
                cornerRadius: 24
            )
            .foregroundColor(Color.white)
            .shadow(
                color: Color.gray.opacity(0.6),
                radius: 2.5,
                x: 0,
                y: 2
            )
        )
        
    }
}

struct SecondChooseLocationScene: View {
    @Binding var isShow:Bool
    @Binding var isShowSelectedSchool:Bool

    @State var txt=""
    
    
    var body: some View {
        GoogleMapView()
        //        Color.gray
            .overlay(
                
                VStack {
                    
                    
                    HStack{
                        
                        Button {
                            withAnimation{
                                isShow.toggle()
                            }
                        } label: {
                            Image("Group 62")
                        }
                        
                        Spacer()
                        
                        Image("Group 66")
                        
                        
                    }
                    .padding()
                    .padding(.top,40)
                    
                    Spacer()
                    
                    VStack{
                        
                        HStack{
                            
                            Image("hugeIconInterfaceOutlineSearch02")
                            
                            TextField("enter search txt", text: $txt)
                                .padding(.horizontal,6)
                            Spacer()
                            
                            HStack{
                                
                                Divider()
                                
                                Button {
                                    withAnimation{
                                        
                                    }
                                } label: {
                                    Image("cocoLineSetting")
                                    
                                }
                                
                                Text("2")
                                    .fontWeight(.semibold)
                                
                            }
                        }
                        .padding(.horizontal)
                        .frame(height:50)
                        .backgroundColor(Color.white)
                        .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
                        .padding(.horizontal,24)
                        
                        LocationRow()
                           
                            .padding(.top,4)
                            .onTapGesture {
                                withAnimation{isShow.toggle()
                                    isShowSelectedSchool.toggle()
                                }
                            }
                    }
                    .padding(.bottom,40)
                    
                }
            )
        
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct SecondChooseLocationScene_Previews: PreviewProvider {
    static var previews: some View {
        //        LocationRow()
        SecondChooseLocationScene(isShow: .constant(false),isShowSelectedSchool: .constant(false))
    }
}
