#---------------------*definition*------------------------
def rx_swift
  pod 'RxSwift'
end

def rx_cocoa
  pod 'RxCocoa'
end

def test_pods
  pod 'RxTest'
  pod 'RxBlocking'
end
#---------------------*WoocerTest*------------------------
target 'WoocerTest' do
        use_frameworks!

  # Pods from definition
  rx_cocoa
  rx_swift

  # Pods
  pod 'RxDataSources'
  pod 'KeychainAccess'
  pod 'PureLayout'
  pod 'NVActivityIndicatorView', '~> 4.4.0'
  pod 'Kingfisher'
  pod 'Firebase/Analytics'
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'
  pod 'Firebase/Crashlytics'
  pod 'CocoaLumberjack/Swift'
  pod 'Material'
  pod 'MaterialComponents', '~> 91.0.0'
  pod 'SwiftSVG'

end
#---------------------*Domain*------------------------

target 'Domain' do
        use_frameworks!

  # Pods 
  rx_swift
  pod 'SwiftyJSON'
  pod 'ReachabilitySwift'

end
#---------------------*NetworkPlatform*------------------------

target 'NetworkPlatform' do
	use_frameworks!

  # Pods 
  rx_swift
  pod 'SwiftyJSON'
  pod 'Moya', '~> 15.0'
  pod 'Swinject'
  pod 'Resolver'
  pod 'KeychainAccess'

end

#---------------------*RealmPlatform*------------------------

target 'RealmPlatform' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  pod 'RxRealm'
  pod 'QueryKit'
  pod 'RealmSwift'
  pod 'Realm'

end



