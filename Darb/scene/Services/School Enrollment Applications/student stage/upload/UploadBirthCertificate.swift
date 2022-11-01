//
//  UploadImage.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI
import UIKit

struct UploadBirthCertificate: View {
    @ObservedObject var vm:SchoolStageViewModel

    var body: some View {
        VStack{
            FilterHeadSection(name: "Birth Certificate")
            
            VStack {
                
                HStack {
                    Text(getName() ?    "Please Select" : vm.uploadFileNameALLOWBirthC)
                        .foregroundColor(ColorConstants.subTtitle2)
                    Spacer()
                    
                    Button {
                        withAnimation{vm.shouldPresentActionScheet.toggle()}
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
        .sheet(isPresented: $vm.mainSheets) {
            SecSUImagePickerView(sourceType: self.vm.shouldPresentCamera ? .camera : .photoLibrary, image: self.$vm.imageALLOWBirthC, isPresented: self.$vm.mainSheets, fileName: .constant(""), fileType: $vm.uploadFileNameALLOWBirthC)

            
        }
        .actionSheet(isPresented: $vm.shouldPresentActionScheet) { () -> ActionSheet in
            ActionSheet(title: Text(LocalizedStringKey("Choose mode")), message: Text(LocalizedStringKey("Please choose your preferred mode to Upload image")), buttons: [ActionSheet.Button.default(Text(LocalizedStringKey("Camera")), action: {
                self.vm.mainSheets=true
                self.vm.shouldPresentImagePicker = true
                self.vm.shouldPresentCamera = true
                
            }), ActionSheet.Button.default(Text("Photo Library"), action: {
                self.vm.mainSheets=true
                self.vm.shouldPresentImagePicker = true
                self.vm.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
    }
    
    func getName() -> Bool {
        vm.uploadFileNameALLOWBirthC == ""
    }
}



struct SchoolStsage_Previews: PreviewProvider {
    static var previews: some View {
        SchoolStage()
    }
}



struct SecSUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var fileName: String
    @Binding var fileType: String

    func makeCoordinator() -> SecImagePickerViewCoordinator {
        return SecImagePickerViewCoordinator(image: $image, isPresented: $isPresented,fileName: $fileName,fileType: $fileType)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class SecImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var fileName: String
    @Binding var fileType: String

    init(image: Binding<Image?>, isPresented: Binding<Bool>,fileName:Binding<String>,fileType:Binding<String>) {
        self._image = image
        self._fileName = fileName
        self._fileType=fileType
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: image)
            
//            self.fileName = image.value(forKey: "filename") as? String ?? ""
            print(fileName)
        }
//        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
//            self.fileName = url.lastPathComponent
//
//            }
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            let s = url.lastPathComponent.count > 15 ? url.lastPathComponent.substring(toIndex: 15) : url.lastPathComponent
            let f = s.replacingOccurrences(of: url.pathExtension, with: "")

            fileName = f//url.lastPathComponent.substring(toIndex: 15)
            let aa = s.contains("\(url.pathExtension)")
            
            if aa {
                fileType = s//url.lastPathComponent

            }else {
                fileType = s+".\(url.pathExtension)" //url.lastPathComponent

            }
            
          
            }

        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}

extension String {
    
    /// Returns String unicode value of country flag for iso code
    func getFlag() -> String {
        unicodeScalars
            .map { 127_397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
    
    var digits: [Int] {
        var result = [Int]()

        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }

        return result
    }
    
    var length: Int {
        return count
    }
    
    var localized:String {
        return NSLocalizedString(self, comment: "")
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isValidPhoneNumber: Bool {
        let phoneNumberRegex = "^[1-1]\\d{10}$"
        //        let phoneNumberRegex = "^[0-0]\\d{10}$"
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return self == "" ? true : isValidPhone
    }
    
    var isValidName: Bool {
        let nameRegEx = "^[A-Za-zء-ي-\\s]+$"
        return NSPredicate(format:"SELF MATCHES %@", nameRegEx).evaluate(with: self)
    }
    
    func toSecrueHttps() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}

