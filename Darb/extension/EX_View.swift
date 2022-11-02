//
//  EX_View.swift
//  PlayIT
//
//  Created by hosam on 07/07/2021.
//  Copyright © 2021 Bola Fayez. All rights reserved.
//

import SwiftUI


extension View {
    
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
    
    func backgroundColor(_ color: Color) -> some View {
       return self.background(color)
     }
    
    func getSafeArea() -> UIEdgeInsets? {
        return UIApplication.shared.windows.first?.safeAreaInsets
    }
    
    func getFrameSize() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func frameWidth() -> CGFloat {
        getFrameSize().width
    }
    
    func frameHeight() -> CGFloat {
        getFrameSize().height
    }
    
  
    
    func isSmallDevice() -> Bool {
        UIScreen.main.bounds.height < 750
    }
    
   
    
   
}

