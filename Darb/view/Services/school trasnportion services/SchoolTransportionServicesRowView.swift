//
//  SchoolTransportionServicesRowView.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI
struct SchoolTransportionServicesRowView: View {
    var x = SchoolTransportionServicesSceneModel(name: "American International School - AISR", forI: " Sarah Smith", from: " King Fahd, Riyadh", to: " Al Aarid, Riyadh")
    var body: some View {
        
        VStack {
            
            HStack {
                Text(x.name)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .lineLimit(2)
                Spacer()
            }
            
            VStack(spacing:8) {
                HStack {
                    HStack(spacing:-4) {
                        Text("For: ")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                        Text(x.forI)
                            .font(.system(size: 14))
                            .foregroundColor(ColorConstants.subTtitle2)
                    }
                    Spacer()
                }
                
                HStack {
                    HStack(spacing:-4) {
                        Text("From: ")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                        Text(x.from)
                            .font(.system(size: 14))
                            .foregroundColor(ColorConstants.subTtitle2)
                    }
                    Spacer()
                }
                
                HStack {
                    HStack(spacing:-4) {
                        Text("To: ")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                        Text(x.to)
                            .font(.system(size: 14))
                            .foregroundColor(ColorConstants.subTtitle2)
                    }
                    Spacer()
                }
                
                
            }
            .padding(.horizontal)
            .padding(.vertical,2)
            
            Button {
                
            } label: {
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
            }
            .frame(height:40)
            
            
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
