//
//  UploadPortraitPhoto.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct UploadPortraitPhoto: View {
    @ObservedObject var vm:SchoolStageViewModel

    var body: some View {
        VStack{
            FilterHeadSection(name: "Portrait Photo")
            
            VStack {
                
                HStack {
                    Text(getName() ?    "Please Select" : vm.uploadFileNameALLOWPortraitPhoto)
                        .foregroundColor(ColorConstants.subTtitle2)
                    Spacer()
                    
                    Button {
                        withAnimation{vm.shouldPresentActionScheet1.toggle()}
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
        .sheet(isPresented: $vm.mainSheets1) {
            SecSUImagePickerView(sourceType: self.vm.shouldPresentCamera ? .camera : .photoLibrary, image: self.$vm.imageALLOWPortraitPhoto, isPresented: self.$vm.mainSheets1, fileName: .constant(""), fileType: $vm.uploadFileNameALLOWPortraitPhoto)

            
        }
        .actionSheet(isPresented: $vm.shouldPresentActionScheet1) { () -> ActionSheet in
            ActionSheet(title: Text(LocalizedStringKey("Choose mode")), message: Text(LocalizedStringKey("Please choose your preferred mode to Upload image")), buttons: [ActionSheet.Button.default(Text(LocalizedStringKey("Camera")), action: {
                self.vm.mainSheets1=true
                self.vm.shouldPresentImagePicker = true
                self.vm.shouldPresentCamera = true
                
            }), ActionSheet.Button.default(Text("Photo Library"), action: {
                self.vm.mainSheets1=true
                self.vm.shouldPresentImagePicker = true
                self.vm.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
    }
    
    func getName() -> Bool {
        vm.uploadFileNameALLOWPortraitPhoto == ""
    }

}
