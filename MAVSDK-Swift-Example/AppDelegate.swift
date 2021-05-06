import UIKit
import Mavsdk
import MavsdkServer

var drone: Drone? = Optional.none

let cloudSimIP = "3.227.233.153" // DWS: change it to the cloud sim IP address

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mavsdkServer = MavsdkServer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let port = mavsdkServer.run() // Connect to H520
//        let port = mavsdkServer.run(systemAddress: "tcp://\(cloudSimIP):5790") // DWS: use it for cloud sim connection
        let port = mavsdkServer.run(systemAddress: "udp://:14530") // DWS: Connect to Astro. Note that normal port is 14540. In one of the skyway versions it was changed to 14530 (it is wrong).
        drone = Drone(port: Int32(port))

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        self.mavsdkServer.stop()
    }
}
