//
//  SliderRange.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SliderRange: View {
    @ObservedObject var vm : SchoolExplorerSceneViewModel
    @State var width:CGFloat = 0
    @State var width1:CGFloat = 100
    var totalWidth:CGFloat = UIScreen.main.bounds.width-60//60
    
    var body: some View {
        VStack(spacing:16){
            HStack {
                FilterHeadSection(name: "School Distance")
                
                Spacer()
                
                
                
                
                Text("\(vm.lowerValue) - \(vm.highetValue) Km")
                    .fontWeight(.bold)
            }
            
            RangedSliderView(value: $vm.sliderPosition, bounds: 1...100)
                .padding(.horizontal)
                .padding(.top)
            
        }
        .padding(.vertical)
        .onChange(of: vm.sliderPosition) { newValue in
            vm.lowerValue=Int(newValue.lowerBound)
            vm.highetValue=Int(newValue.upperBound)
            vm.rangeCount=1
        }
    }
    
    func onChange(value:DragGesture.Value)  {
        if value.location.x >= 0 && value.location.x <= width1 {
            self.width=value.location.x
        }
    }
    
    func secondOnChange(value:DragGesture.Value)  {
        if value.location.x <= totalWidth && value.location.x >= width {
            self.width1=value.location.x
        }
    }
    
    func getValue(val:CGFloat) -> String {
        //        return String(format: "%.2f", val)
        
        return String(format: "%.1f", val)
    }
}

struct SchoolFilsterScene_Previews: PreviewProvider {
    static var previews: some View {
        SchoolFilterScene(vm: SchoolExplorerSceneViewModel())
    }
}
