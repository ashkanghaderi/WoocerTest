
import UIKit

protocol FirebasePushNotificationTokenStorage: class
{
    var getToken:String? { get }
    func saveNewToken(_ apn: String)
}


final class UserDefaultsFirebasePushNotificationTokenStorage: FirebasePushNotificationTokenStorage
{
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    lazy var getToken: String? = {
       return userDefaults.string(forKey: keyInDefaults)
    }()
    
    func saveNewToken(_ apn: String) {
        userDefaults.set(apn, forKey: keyInDefaults)
        userDefaults.synchronize()
    }
    
    private let keyInDefaults = "FirebaseToken"
    private let userDefaults: UserDefaults
    
}

