//
//  ServiceRow.swift
//  Darb
//
//  Created by hosam on 31/10/2022.
//

import SwiftUI

struct ServiceRow:View {
    var x = ServiceRowModel(name: "hello my", img: "darb logo 1")
    
    var body: some View {
        
        VStack{

            HStack {
                HStack(spacing:24) {
                    Image(x.img)
                    
                    Text( x.name)
                        .fontWeight(.semibold)
                    
                }
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 24))
            }
            .padding()
            .padding(.vertical,4)
            
        }
        .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 16)
        
    }
}

struct ServiceRow_Previews: PreviewProvider {
    static var previews: some View {
//        ServiceRow()
        MainSerivcesScene()
    }
}
