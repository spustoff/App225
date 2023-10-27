//
//  App225App.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    @AppStorage("random_id") var random_id: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        notificationsGetStarted()
        
        OneSignal.initialize("fbbe8b75-fc78-49be-b951-a9e6180e9832", withLaunchOptions: launchOptions)
        OneSignal.login(random_id)
        
        
        Apphud.start(apiKey: "app_PYDaf1u4W4qbYvZEq2R7RAu7yZ8njT")
        Amplitude.instance().initializeApiKey("ddd960261d7f6971cb6698e99a42653a")
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    @AppStorage("random_id") var random_id: String = ""
    
    if random_id.isEmpty {
        
        let randomId = Int.random(in: 1...99999)
        random_id = "\(randomId)"
    }
    
    var url = "https://onesignal-ba.com/api/os/m8cs9JW0d9VwWLRmsvMr/"
    
    url += random_id
    
    let request = AF.request(url, method: .get)
    
    request.responseDecodable(of: NewsModel.self) { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App225App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
