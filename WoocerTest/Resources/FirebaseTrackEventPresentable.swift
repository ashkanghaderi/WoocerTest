
import Foundation
import Firebase

/// <#Description#>
protocol FirebaseTrackEventPresentable {
    var rawValue : String { get }
}

class FirebaseTrackerManager : NSObject {
    
    enum FirebaseMain : String, FirebaseTrackEventPresentable {
        case appInstalled = "App_Installed"
        case appOpened = "App_Opened"
        case appClosed = "App_Closed"
    }
    
    enum FirebaseAuthentication : String, FirebaseTrackEventPresentable {
        case registerBtnPrsd = "Landing_Register_btn_Prsd"
        case loginBtnPrsd = "Landing_Login_btn_Prsd"
    }
    
    static let shared : FirebaseTrackerManager = {
        return FirebaseTrackerManager()
    }()
    
    func sendEvent(event : FirebaseTrackEventPresentable,callbackParameters input : [String:String]? = nil) {
        Analytics.logEvent(event.rawValue, parameters: input)
    }
    
    func sendEvent(eventName : String) {
        Analytics.logEvent(eventName, parameters: nil)
    }
    
}
