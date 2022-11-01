//
//  SchoolExplorerScene.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI



struct SchoolModel:Identifiable {
    var id = UUID().uuidString
//    var img:[String] = ["image 3","image 3","image 3"]
    var img = "image 3"
    
    var name,secName,place:String
    var rating:Double
    var reviews:Int
    
    
    
}

struct SchoolExplorerScene: View {
    
    @StateObject var vm = SchoolExplorerSceneViewModel()
    @State var columnss = Array(repeating: GridItem(.flexible(), spacing: 12), count: 1)//12

    var body: some View {
        VStack{
            
            HStack {
                Text("The School Exolorer")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
                
                Button {
                    withAnimation{
                        
                    }
                } label: {
                    Label {
                        
                        Text("Maps")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    } icon: {
                        
                        Image("Vector 1")
                    }
                    
                }
                .padding(12)
                .backgroundColor(ColorConstants.servicesTit)
                .cornerRadius(12)
                
            }
            
            HStack{
                
                Image("hugeIconInterfaceOutlineSearch02")
                
                TextField("enter search txt", text: $vm.searchTxt)
                    .padding(.horizontal,6)
                Spacer()
                
                HStack{
                    
                    Divider()
                    
                    Button {
                        withAnimation{
                            
                        }
                    } label: {
                        Image("cocoLineSetting")
                        
                    }
                    
                    Text("2")
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.horizontal)
            .frame(height:50)
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            
            
            // The actual days of the month.
            
            ScrollView {
                
            
            
            VStack{
                
                LazyVGrid(columns: columnss, spacing: 20) {
                    
                    //            HStack {
                    ForEach(fetchArray()) { index in
                        SchoolRow(x:index)
                    }
                    //            }
                }
                
            }
                
            }
            
        }
        .padding(.horizontal,24)
    }
    
    func fetchArray() -> [SchoolModel] {
        vm.searchTxt=="" ? vm.schoolArrays : vm.schoolArrays.filter{$0.name.lowercased().contains(vm.searchTxt)}
    }
}

struct SchoolExplorerScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolExplorerScene()
    }
}
