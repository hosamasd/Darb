//
//  Location.swift
//  Darb
//
//  Created by hosam on 01/11/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocation


struct GoogleMapView: UIViewRepresentable {
    @State var coordinator = Coordinator()
    
    //    @Binding var myLocation:CLLocation
    
    func makeUIView(context _: Context) -> GMSMapView {
        let view = GMSMapView(frame: .zero)
        view.isMyLocationEnabled = true
        view.animate(toZoom: 18)
        view.addObserver(coordinator, forKeyPath: "myLocation", options: .new, context: nil)
        return view
    }
    
    func updateUIView(_ uiView: GMSMapView, context _: UIViewRepresentableContext<GoogleMapView>) {}
    
    func makeCoordinator() -> GoogleMapView.Coordinator {
        
        return coordinator
    }
    
    static func dismantleUIView(_ uiView: GMSMapView, coordinator: GoogleMapView.Coordinator) {
        uiView.removeObserver(coordinator, forKeyPath: "myLocation")
    }
    
    final class Coordinator: NSObject {
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            if let location = change?[.newKey] as? CLLocation, let mapView = object as? GMSMapView {
                mapView.animate(toLocation: location.coordinate)
                
                // Save location to UserDefaults
                //                if let encodedLocation = try? NSKeyedArchiver.archivedData(withRootObject: location, requiringSecureCoding: false) {
                //                    UserDefaults.standard.set(encodedLocation, forKey: "savedLocation")
                //                }
                
                // or
                
                let encodedLocation = NSKeyedArchiver.archivedData(withRootObject: location)
                UserDefaults.standard.set(encodedLocation, forKey: "savedLocation")
                
                // for reterive it
                
                //                let previousLocationEncoded = UserDefaults.standard.object(forKey: "savedLocation") as? Data
                //                let previousLocationDecoded = NSKeyedUnarchiver.unarchiveObject(with: previousLocationEncoded!) as! CLLocation
                
                
                //                self..myLocation=location
                
            }
            
        }
    }
}


struct Location_Previews: PreviewProvider {
    static var previews: some View {
        //        GoogleMapView()
        ChooseLocationScene(isShow: .constant(false))
        
    }
}
