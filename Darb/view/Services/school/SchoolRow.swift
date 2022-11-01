//
//  SchoolRow.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI

struct SchoolRow: View {
    var x = SchoolModel(name: "American International", secName: " School - AISR", place: "Al Aarid, Riyadh", rating: 4.5, reviews: 385)
    
    var body: some View {
        VStack{
            
            TabViewImages()
                .frame(height:150)
            
//            Image(x.img)
//                .resizable()
                .cornerRadius(12)
                .padding(.vertical,6)
            
            HStack {
                VStack (alignment: .leading){
                    Text(x.name)
                        .font(.system(size: 16))
                    .fontWeight(.bold)
                    
                    Text(x.secName)
                        .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.top,-12)
                    
                    Text(x.place)
                        .font(.system(size: 16))
                        .foregroundColor(Color.gray.opacity(0.6))
                        .padding(.top,-4)
                }
                
                Spacer()
                
                VStack {
                    
                    FiveStarView(rating: 4.5)
                        .frame(minWidth: 1, idealWidth: 20, maxWidth: 20, minHeight: 1, idealHeight: 20, maxHeight: 20)//, alignment: .center)
                    
                    HStack {
                        Text(String(format: "%.1f", x.rating))
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                        Text("from \(x.reviews) reviews")
                            .font(.system(size: 14))

                        .foregroundColor(Color.gray.opacity(0.6))
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)

        .background(
            RoundedRectangle(
                cornerRadius: 24
            )
            .foregroundColor(Color.white)
            .shadow(
                color: Color.gray.opacity(0.6),
                radius: 2.5,
                x: 0,
                y: 2
            )
        )
        
//        .modifier(viewModifiers())

    }
}

struct SchoolRow_Previews: PreviewProvider {
    static var previews: some View {
        SchoolExplorerScene()
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
