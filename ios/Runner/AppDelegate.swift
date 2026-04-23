import UIKit
import Flutter
import GoogleMaps // Обязательно добавить этот импорт

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Добавить провайдер ключа (пока с заглушкой)
    GMSServices.provideAPIKey("YOUR_MOCK_API_KEY_HERE") 
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
