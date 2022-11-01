//
//  SchoolEnrollmentApplicationsRowView.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SchoolEnrollmentApplicationsRowView:View {
    var x = SchoolEnrollmentApplicationsModel(name: "American International School - AISR", secName: "Al Aarid, Riyadh",img: "image 3")
    
    var body: some View {
        
        VStack {
            HStack(spacing:16) {
                Image(x.img)
                    .resizable()
//                    .frame(height:50)
                    .cornerRadius(16)
                
                VStack{
                    HStack {
                    Text(x.name)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        .lineLimit(2)
                        Spacer()
                    }
                    
                    HStack {
                        Text(x.secName)
                            .font(.system(size: 14))

                            .foregroundColor(ColorConstants.subTtitle2)
                        .padding(.top,-8)
                        Spacer()
                    }
                    
                    Button {
                        
                    } label: {
                        if x.isProceess {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color.white)

                                .addBorder(Color.black.opacity(1), width: 1, cornerRadius: 16)
                                .overlay(
                                    
                                    Label {
                                        Text("Processing")
                                            .foregroundColor(Color.black.opacity(0.8))
                                    } icon: {
                                        Image("timer")
                                        
                                    }
                                )
                            
                        }else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .addBorder(Color.black.opacity(1), width: 1, cornerRadius: 16)
                                .overlay(
                                    Text("Rejected")
                                        .foregroundColor(Color.black.opacity(0.8))

                                  
                                )
                            
                        }
                        
                        
                    }
                    .frame(height:40)

                    
                }
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

