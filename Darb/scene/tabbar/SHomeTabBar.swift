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
    @State var index = 3
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


           
