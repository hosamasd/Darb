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
//        ZStack {
//
//            if vm.isShowSelectedSchool {
//                SchoolDetailScene(vm: vm)
//                    .transition(.move(edge: .leading))
//            }
//            else {
                VStack{
                    
                    HStack {
                        Text("The School Exolorer")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        
                        Button {
                            withAnimation{
                                vm.isShowMaps.toggle()
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
                                    .onTapGesture {
                                        withAnimation{vm.isShowFilter.toggle()}
                                    }
                            }
                            
                            Text("\(vm.filterCount)")
                                .fontWeight(.semibold)
                            
                        }
                    }
                    .padding(.horizontal)
                    .frame(height:50)
                    .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
                    
                    
                    // The actual days of the month.
                    
                    ScrollView(showsIndicators:false) {
                        
                        
                        
                        VStack{
                            
                            LazyVGrid(columns: columnss, spacing: 20) {
                                
                                //            HStack {
                                ForEach(fetchArray()) { index in
                                    SchoolRow(x:index)
                                        .onTapGesture {
                                            withAnimation{
                                                vm.selectedSchool=index
                                                vm.isShowSelectedSchool.toggle()
                                                
                                            }
                                        }
                                }
                                //            }
                            }
                            
                        }
                        .padding(.bottom)
                        
                    }
                    .padding(.bottom,80)
                    
//                }
//                .transition(.move(edge: .trailing))
//
//            }
//
        }
        .padding(.horizontal,8)
        
        .background(EmptyView()
            .fullScreenCover(isPresented: $vm.isShowFilter, content: {
                SchoolFilterScene(vm:vm)

            })
                    )
        
        .background(EmptyView()
            .fullScreenCover(isPresented: $vm.isShowMaps, content: {
                SecondChooseLocationScene(isShow: $vm.isShowMaps,isShowSelectedSchool: $vm.isShowSelectedSchool)
//                SchoolFilterScene(vm:vm)

            })
                    )
        .background(EmptyView()
            .fullScreenCover(isPresented: $vm.isShowSelectedSchool, content: {
                SchoolDetailScene(vm: vm)
//                SchoolFilterScene(vm:vm)

            })
                    )
        
        

    }
    
    func fetchArray() -> [SchoolModel] {
        vm.searchTxt=="" ? vm.schoolArrays : vm.schoolArrays.filter{$0.name.lowercased().contains(vm.searchTxt.lowercased())}
    }
}

struct SchoolExplorerScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolExplorerScene()
    }
}
