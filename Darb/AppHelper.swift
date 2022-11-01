//
//  AppHelper.swift
//  Workforce Pro
//
//  Created by Mahmoud Abdul-wahab on 1/9/21.
//

import UIKit
import SwiftUI
import Foundation


enum AppHelper {
    

    static func removeLocalObject(){
//        UserDefaults.standard.removeObject(forKey: AppKeys.LOCAL_OBJECT.rawValue)
//        UserDefaults.standard.removeObject(forKey: AppKeys.LOCAL_USERNAME.rawValue)
//        AppHelper.setDataInUserDefaults(value: false, key: AppKeys.isUserLogin)//logout

        UserDefaults.standard.removeObject(forKey: "checks")
    
        
    }

    static func logOutOperations(){
        removeLocalObject()
//        AppHelper.updateLoginStatus(status: AppKeys.UN_REGISTERED)
    }
    
//    static var isUserLogins:Bool{
//        return (getDataFromUserDefaults(type: Bool.self, forKey: AppKeys.isUserLogin)) ?? false//?? true
//    }
    
//    static var isMainAppVISTOR:Bool{
//        return (getDataFromUserDefaults(type: Bool.self, forKey: AppKeys.isMainAppVISTOR)) ?? false//?? true
//    }
    
   
    
//    static func setDataInUserDefaults<T>(value: T, key: AppKeys) {
//       let defaults = UserDefaults.standard
//       defaults.set(value, forKey: key.rawValue)
//    }
    
    
//    static func getDataFromUserDefaults<T>(type: T.Type, forKey: AppKeys) -> T? {
//       let defaults = UserDefaults.standard
//       let value = defaults.object(forKey: forKey.rawValue) as? T
//       return value
//    }
//
//
//    static func removeDataFromUserDefaults(key: AppKeys) {
//       let defaults = UserDefaults.standard
//       defaults.removeObject(forKey: key.rawValue)
//    }
//
//
//
//
//    static func isFaceLoginEnabled()->Bool{
//        !(UserDefaults.standard.bool(forKey:"FACELOGINENABLED"))
//    }
//
//    static func setAppLanguage(lang: AppKeys){
//        setDataInUserDefaults(value: lang.rawValue, key: AppKeys.LANGUAGE)
//    }
    
//    static func getAppLang()-> String {
//        return getDataFromUserDefaults(type: String.self, forKey: AppKeys.LANGUAGE) ?? "en"
//    }
//
    
    static func saveObjectLocally<T : Codable>(newObject : T , objectKey  : String){

        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(newObject)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: objectKey)
            UserDefaults.standard.synchronize()

        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
//
//    static  func getUserFromCache() -> Theme{
//         let cacheKey = "currentUser" as AnyObject
//        let cache = NSCache<AnyObject, AnyObject>()
//        return cache.object(forKey: cacheKey) as? Theme ?? Theme0
////         let cache = NSCache<AnyObject, AnyObject>()
////           // here the user is always nil
////         if let user = cache.object(forKey: cacheKey) as? Theme {
////                return user
////          }
////          else {
////            return Theme0
////         }
//      }
//
//
//
//    static  func cachTheme(theme:Theme) {
//           let cacheKey = "currentUser" as AnyObject
//         let cache = NSCache<AnyObject, AnyObject>()
//           cache.setObject(theme  as AnyObject, forKey: cacheKey)
//         print(cache.object(forKey: cacheKey) as? Theme)
//      }


    static func getLocalObject<T:Codable>(objectKey : String)->T?{
        if let data = UserDefaults.standard.data(forKey: objectKey) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let savedObject = try decoder.decode(T.self, from: data)
                return savedObject

            } catch {
                print("Unable to Decode Note (\(error))")

            }
        }
        return nil
    }

    
 
    
    
    
   
    
    static  var todayDate: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d,yyyy"
        return formatter.string(from: date)
    }
    
    static func convertBase64StringToImage (imageBase64String:String) -> UIImage? {
        let w = imageBase64String.replacingOccurrences(of: "data:image/jpeg;base64", with: "")

        if w != nil {

              let decodedData = NSData(base64Encoded: w, options: .ignoreUnknownCharacters)
                  if let data = decodedData {
                      let decodedimage = UIImage(data: data as Data)
                      return decodedimage
                  } else {
                      print("error with decodedData")
                  }
              } else {
                  print("error with base64String")
              }
          return #imageLiteral(resourceName: "logo png-1")
        
    }
//        var image: UIImage = UIImage(named: "logo png-1")!
//
//        if  let imageDataURL = URL(string: imageBase64String) {
//              do {
//                    let imageData = try? Data(contentsOf: imageDataURL)
//                image = UIImage(data: imageData ?? Data()) ?? UIImage(named: "person")!
//                return image
//              }
//              
//          }
//        return image
//    }
    
    
//    static var userInfo: UserModel?{
//        guard   let user: UserModel = AppHelper.getLocalObject(objectKey: AppKeys.LOCAL_OBJECT.rawValue) else {
//            return nil
//        }
//        return user
//    }
    
//    static var userImeagBase64: String?{
//        guard   let user: String = AppHelper.getLocalObject(objectKey: AppKeys.UserImeagBase64.rawValue) else {
//            return nil
//        }
//        return user
//    }
    
   

    
//    static var userInfo: UserModel?{
//        guard   let user: UserModel = AppHelper.getLocalObject(objectKey: AppKeys.LOCAL_OBJECT.rawValue) else {
//            return nil
//        }
//        return user
//    }
//
//    static var token: String?{
//        return userInfo?.token
//    }
    
//    static var username: String?{
//        return userInfo?
//    }
    
//   static func updateLoginStatus(status: AppKeys){
//        AppHelper.setDataInUserDefaults(value: status.rawValue, key: AppKeys.LOGIN_STATUS)
//    }
//    static func getLoginStatus()->String{
//        AppHelper.getDataFromUserDefaults(type: String.self, forKey: AppKeys.LOGIN_STATUS) ?? ""
//     }
    
   
   
    
    
    static func getDeviceUUID()->String{
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
//    static var canShowRequests:Bool{
//        return (getDataFromUserDefaults(type: Bool.self, forKey: AppKeys.SHOWREQUESTS)) ?? true
//    }
//
//    static var canShowEmployeeEvaluations:Bool{
//        return (getDataFromUserDefaults(type: Bool.self, forKey: AppKeys.ShowEmployeeEvaluations)) ?? false//?? true
//    }
//
//    static var canShowVactiosPlans:Bool{
//        return (getDataFromUserDefaults(type: Bool.self, forKey: AppKeys.ShowVcationsPlans)) ?? false//true
//    }
    
    static var isLdapOn: Bool = false
    
//    static func  navigateToLoginVC(){
//        let welcomSB = UIStoryboard(name: "WelcomScreenSB", bundle:nil)
//
//        let welcomScreenVC = welcomSB.instantiateViewController(withIdentifier: "WelcomScreenVC") as! WelcomScreenVC
//         window?.makeKeyAndVisible()
//
//         window?.rootViewController = welcomScreenVC
//    }
    
}

//extension Array {
//    func indexesOf<T : Equatable>(object:T) -> [Int] {
//        var result: [Int] = []
//        for (index,obj) in enumerate(self) {
//            if obj as T == object {
//                result.append(index)
//            }
//        }
//        return result
//    }
//}
