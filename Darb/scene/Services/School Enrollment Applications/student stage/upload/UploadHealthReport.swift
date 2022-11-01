//
//  UploadHealth Report.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct UploadHealthReport: View {
    @ObservedObject var vm:SchoolStageViewModel

    var body: some View {
        VStack{
            FilterHeadSection(name: "Health Report")
            
            VStack {
                
                HStack {
                    Text(getName() ?    "Please Select" : vm.uploadFileNameALLOWHealthReport)
                        .foregroundColor(ColorConstants.subTtitle2)
                    Spacer()
                    
                    Button {
                        withAnimation{vm.shouldPresentActionScheet2.toggle()}
                    } label: {
                        Text("Browse")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.vertical,8)
                            .padding(.horizontal,24)
                            .backgroundColor(ColorConstants.servicesTit)
                            .clipShape(Capsule())
                    }

                }
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
        }
        .sheet(isPresented: $vm.mainSheets2) {
            SecSUImagePickerView(sourceType: self.vm.shouldPresentCamera ? .camera : .photoLibrary, image: self.$vm.imageALLOWHealthReport, isPresented: self.$vm.mainSheets2, fileName: .constant(""), fileType: $vm.uploadFileNameALLOWHealthReport)

            
        }
        .actionSheet(isPresented: $vm.shouldPresentActionScheet2) { () -> ActionSheet in
            ActionSheet(title: Text(LocalizedStringKey("Choose mode")), message: Text(LocalizedStringKey("Please choose your preferred mode to Upload image")), buttons: [ActionSheet.Button.default(Text(LocalizedStringKey("Camera")), action: {
                self.vm.mainSheets2=true
                self.vm.shouldPresentImagePicker = true
                self.vm.shouldPresentCamera = true
                
            }), ActionSheet.Button.default(Text("Photo Library"), action: {
                self.vm.mainSheets2=true
                self.vm.shouldPresentImagePicker = true
                self.vm.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
    }
    
    func getName() -> Bool {
        vm.uploadFileNameALLOWHealthReport == ""
    }

}

