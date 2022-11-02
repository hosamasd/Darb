//
//  ListTable.swift
//  Darb
//
//  Created by hosam on 02/11/2022.
//

import SwiftUI

struct Cells:View {
    var name = "cell"
    
    var body: some View {
        Text(name)
            .font(.system(size: 10))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)

            .frame(width:60   ,height:60)
            
            .background(ColorConstants.topTable)
        
    }
}

struct ROWTABLEmODEL:Identifiable {
    var id = UUID().uuidString
    
    var name,abse,late,percent:String
    var count = 1

}

class StudentAttendanceRecordSceneViewModel: ObservableObject {
    @Published var tableMailListSoftwrae:[ROWTABLEmODEL]=[
        .init(name: "Sceience", abse: "1", late: "0", percent: "50"),
        .init(name: "Sceien", abse: "2", late: "1", percent: "30",count: 2),
        .init(name: "Mathematics", abse: "2", late: "1", percent: "30",count: 3),

            .init(name: "Sceience", abse: "1", late: "0", percent: "50",count: 4),
            .init(name: "Sceien", abse: "2", late: "1", percent: "30",count: 5),
            .init(name: "Mathematics", abse: "2", late: "1", percent: "30",count: 6),
    ]

}

struct SCells:View {
    var name = "cell"
    var isService = false
    
    var body: some View {
        Text(name)
            .font(.system(size: 10))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)

//            .frame(width:60   ,height:isService ? 50 : 30)
        
        //            .background(Color.white)
        
    }
}

struct SoftTableView: View {
    var x : ROWTABLEmODEL

    var body: some View {
        
        HStack(alignment: .center, spacing: nil) {
                        Text(x.name)
                .frame(maxWidth: getFrameSize().width/4, alignment: .leading)
                        Divider()
            
            Text(x.abse)
                .foregroundColor(ColorConstants.servicesTit)
                .frame(maxWidth: getFrameSize().width/6, alignment: .center)
                        Divider()
//
                        Text(x.late)
                .foregroundColor(ColorConstants.servicesTit)

                .frame(maxWidth: getFrameSize().width/12, alignment: .center)
//
            Divider()
            Text(x.percent)
                .foregroundColor(ColorConstants.servicesTit)

                .frame(maxWidth: getFrameSize().width/12, alignment: .center)
                }
        .padding(.horizontal)

        .backgroundColor(x.count % 2 == 1 ?  ColorConstants.subTtitle.opacity(0.2) :  Color.white)

        
    }
}

struct ListTable: View {
    var teamNames = ["Subject", "Absences", "Late", "%"]
    @StateObject var vm = StudentAttendanceRecordSceneViewModel()

    var body: some View {
        VStack{
            HStack {
                HStack {
                    Text("Subject")
                        .foregroundColor(ColorConstants.subTtitle2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .frame(maxWidth:getFrameSize().width/4)
                
                Spacer()
                Text("Absences")
                    .foregroundColor(ColorConstants.subTtitle2)
                Spacer()
                
                Text("Late")
                    .foregroundColor(ColorConstants.subTtitle2)
                Spacer()
                
                Text("%")
                    .foregroundColor(ColorConstants.subTtitle2)
                Spacer()
                
            }
            .padding()
            .backgroundColor(ColorConstants.topTable)
            
            
            VStack(spacing:0){
                    ForEach(vm.tableMailListSoftwrae) {i in
                        
                        SoftTableView(x: i)
                            .frame(height:60)
                    }
//                }
            }
            .addBorder(Color.gray.opacity(0.4), width: 1, cornerRadius: 1)

            
        }
        
    }
}

struct ListTable_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        StudentAttendanceRecordScene()
    }
}
