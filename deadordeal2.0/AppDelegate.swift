//
//  AppDelegate.swift
//  deadordeal2.0
//
//  Created by imac on 14/03/24.
//

import UIKit
import AVFoundation
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var player: AVAudioPlayer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        stopAudio()
    }
    
    func playAudio() {
            if let path = Bundle.main.path(forResource: "new-york-skyline-203813", ofType: "mp3") {
                let url = URL(fileURLWithPath: path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.numberOfLoops = -1
                    player?.play()
                } catch {
                    print("Error playing audio: \(error.localizedDescription)")
                }
            } else {
                print("Audio file not found")
            }
        }
        
        func stopAudio() {
                player?.stop()
        }

}

