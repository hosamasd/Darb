//
//  StudentStage.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI




struct StudentStage: View {
    @ObservedObject var vm:SchoolStageViewModel

    var body: some View {
        VStack(spacing:16) {
            
            FilterHeadSection(name: "First Name")
            
            VStack {
                
                TextField("First Name", text: $vm.firstName)
                    .padding(.leading)
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
            FilterHeadSection(name: "Last  Name")
            
            VStack {
                
                TextField("Last Name", text: $vm.lastName)
                    .padding(.leading)
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
            FilterHeadSection(name: "Birthdate")

            VStack {
                
                HStack {
                    DatePicker("", selection: self.$vm.birthDate, displayedComponents: .date)
                        .labelsHidden()
                        .padding(.leading)
                    Spacer()
                }
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
            FilterHeadSection(name: "National ID Number")

            VStack {
                
                TextField("National ID Number", text: $vm.NationalIDNumber)
                    .padding(.leading)
                    .keyboardType(.numberPad)
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
            VStack{
                UploadBirthCertificate(vm:vm)
                UploadPortraitPhoto(vm: vm)
                UploadHealthReport(vm: vm)
            }
        }
        .padding(.vertical)
    }
}

//struct StudentStage_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentStage()
//    }
//}
