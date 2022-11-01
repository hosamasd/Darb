//
//  viewModifiers.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI


struct viewModifiers: ViewModifier {
//    @State var color = Color.black.opacity(0.07)

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(
                    cornerRadius: 10
                )
                .foregroundColor(Color.white)
                .shadow(
                    color: Color.gray.opacity(0.6),
                    radius: 2.5,
                    x: 0,
                    y: 2
                )
            )
    }
}
