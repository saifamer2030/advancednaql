import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyASpc8HqIa7OPmBeSJu7szAStFHeKpbC2U")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
