//
//  SHomeTabBar.swift
//  Blue Bird
//
//  Created by hosam on 20/07/2022.
//

import SwiftUI

struct SHomeTabBar: View {
    init() {
        UITabBar.appearance().isHidden=true
    }
//    @EnvironmentObject var vmm : ContentViewViewModel
    @State var index = 0
    var body: some View {
        TabView(selection: $index) {

            MainSerivcesScene()
            
                .frame(maxWidth:.infinity,maxHeight:.infinity)

//                .environmentObject(vmm)
                .tag(0)
            
            MainSerivcesScene()
                .frame(maxWidth:.infinity,maxHeight:.infinity)

                .tag(1)
            
            MainSerivcesScene()
                .frame(maxWidth:.infinity,maxHeight:.infinity)

                .tag(2)
            
            MainSerivcesScene()
                .frame(maxWidth:.infinity,maxHeight:.infinity)

                .tag(3)
            
            MainSerivcesScene()
                .frame(maxWidth:.infinity,maxHeight:.infinity)

                .tag(4)
            
        }
        .overlay(
        
           
        
            TabBar(index: $index)//$vmm
//                .offset(y:vmm.isHideTabBar ? 100 : 0)
                
            
//                .frame(height:100)
//                .edgesIgnoringSafeArea(.bottom)
//                .background(Color.red.clipShape(CustomCurve()))
//                    .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
//                    .ignoresSafeArea(.container, edges: .bottom)
               
//                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: -5, y: 5)

            ,alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SHomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        SHomeTabBar()
    }
}


            struct CustomCurve: Shape {
                
                func path(in rect: CGRect) -> Path {

                return Path{path in
                    
                    path.move(to: CGPoint(x: 0, y: 0))
            //        path.addLine(to: CGPoint(x: 0, y: rect.height))
                    path.addLine(to: CGPoint(x: rect.width, y: 0))

                    path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                    path.addLine(to: CGPoint(x: 0, y: rect.height))
                    // adding Curve...
                    
                    let mid=rect.width/2
                    
                    
                    
                    path.move(to: CGPoint(x: 0, y: 0))//40
                    
//                    let to1=CGPoint(x: mid, y: 45)
//                    let control1 = CGPoint(x: mid-35, y: 0)
//                    let control2 = CGPoint(x: mid-35, y: 45)
//
//                    path.addCurve(to: to1, control1: control1, control2: control2)
//
//                    let to2=CGPoint(x: mid+70, y: 0)
//                    let control3 = CGPoint(x: mid+35, y: 45)
//                    let control4 = CGPoint(x: mid+35, y: 0)
//
//                    path.addCurve(to: to2, control1: control3, control2: control4)
            //        path.addArc(center: CGPoint(x: getFrameSize().width/2 , y: 0), radius: 42, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: false)

                  
                }
                }
            }
