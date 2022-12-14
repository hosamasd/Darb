//
//  StudentAttendanceRecordScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct StudentAttendanceRecordScene: View {
    @StateObject var vm = StudentAttendanceRecordSceneViewModel()
    var body: some View {
        ScrollView(isSmallDevice() ? .vertical : .init(),showsIndicators:false){
            VStack{
                
                HStack {
                    Text("Student Attendance Record")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                Divider()
                    .padding(.bottom)
                    .padding(.top,-8)
                
                ScrollView(showsIndicators:false) {
                    VStack{
                        
                        
                        HStack {
                            Text("Student Information")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.bottom)
                        
                        VStack(spacing:8){
                            HStack{
                                
                                HStack(spacing:0) {
                                    Text("Student Name:")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                    
                                    Text("Sarah Smith")
                                        .font(.system(size: 14))
                                        .foregroundColor(ColorConstants.subTtitle2)
                                }
                                Spacer()
                                
                            }
                            
                            HStack{
                                
                                HStack(spacing:0) {
                                    Text("Grade:")
                                        .font(.system(size: 15))
                                    
                                        .fontWeight(.bold)
                                    
                                    Text(" 5th grade")
                                        .font(.system(size: 14))
                                        .foregroundColor(ColorConstants.subTtitle2)
                                }
                                Spacer()
                                
                            }
                            HStack{
                                
                                HStack(spacing:0) {
                                    Text("Section :")
                                        .font(.system(size: 15))
                                    
                                        .fontWeight(.bold)
                                    
                                    Text("A")
                                        .font(.system(size: 14))
                                        .foregroundColor(ColorConstants.subTtitle2)
                                }
                                Spacer()
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Absences and Late")
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.top)
                        
                        
                        ListTable( vm: vm)
                            .padding(.bottom,80)
                        
                        //table
                        
                        //                    .padding()
                        
                        Spacer()
                    }
                }
                
                
            }
        }
        .padding(.horizontal,8)
        
    }
}

struct StudentAttendanceRecordScene_Previews: PreviewProvider {
    static var previews: some View {
        StudentAttendanceRecordScene()
    }
}
