//
//  CustomRatingView.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct RateView:View {
    
    var x = ""
    
    var body: some View {
         
                Image(x)
                    
           
        }
    }
    
//    func checks(w:Int) -> Bool {
//        switch w {
//        case 0 :
//           return true
//        case 1:
//        return    x > 0
//        case 2 :
//            return    x > 1
//
//        case 3:
//            return    x > 2
//
//        default:
//            return    x > 3
//
//        }
//    }
struct CustomRatingView: View {
    @ObservedObject var vm : SchoolExplorerSceneViewModel
   
    var body: some View {
        VStack{
            
            VStack{
                
                HStack {
                    if vm.selectedRating != "" {
                        Image(vm.selectedRating)
                    }else {
                        Text("Please Select")
                            .foregroundColor(ColorConstants.subTtitle2)
                    }
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                }
                
            }
            .padding()
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
            .onTapGesture {
                withAnimation{
                    vm.isShowRating.toggle()
                }
            }
            
            if vm.isShowRating {
                VStack(spacing:8) {
                    ForEach(vm.ratingArray,id: \.self){ x  in
                        HStack {
                            Label {
                               Image(x)
                            } icon: {
                                Image(systemName: vm.selectedRating==x ? "checkmark.square.fill" :  "square.fill")
                                
                                                .foregroundColor(vm.selectedRating != x  ? Color.gray.opacity(0.2 ) : ColorConstants.servicesTit)
                            }
                          
                            Spacer()
                        }
                        .padding(.horizontal,24)
                            .onTapGesture {
                                withAnimation{
//                                    self.x=x
                                    vm.count=1
//                                    vm.count += 1
//                                    self.vm.filterCount = vm.count == 1 ? vm.filterCount+1 : vm.filterCount
                                    self.vm.selectedRating=x
                                    vm.isShowRating.toggle()
                                }
                            }
                    
                }
                .padding(.top,4)
                .padding(.bottom,16)
                    
                }
                
            }
            
            
        }
        .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)

    }
}


