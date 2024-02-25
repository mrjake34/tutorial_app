import Flutter
import UIKit
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    /// Güvenlik nedeniyle IP adresi kısıtlaması yapıldı.
    /// Bu nedenle Google Maps API Key'i kısıtlıdır.
    /// Eğer uygulamayı çalıştırmak isterseniz, kendi API Key'inizi kullanmalısınız.
    /// API Key almak için: https://developers.google.com/maps/documentation/ios-sdk/get-api-key
    GMSServices.provideAPIKey("AIzaSyBDfOvDcHODZDGwkQqooDGNs1tjCHrtJYk")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
