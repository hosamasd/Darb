//
//  FilterSection.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct FilterSection:View {
    var name = "STUDENT FILTERS"
    
    var body: some View {
        
        VStack (spacing:4){
            HStack {
                Text(name)
                    .font(.system(size: 14))
                    .foregroundColor(ColorConstants.subTtitle2)
                Spacer()
            }
            
            Divider()
        }
    }
}

struct FilterHeadSection:View {
    var name = "Student Gender"
    
    var body: some View {
        
        VStack (spacing:4){
            HStack {
                Text(name)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                Spacer()
            }
            
        }
    }
}
