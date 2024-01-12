//
//  AppDelegate.swift
//  UIKit-SSO
//
//  Created by Vignesh on 08/01/24.
//

import UIKit
import AuthenticationServices

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { (credentialState, error) in
            switch credentialState {
            case .authorized:
                break
            case .revoked, .notFound:
                DispatchQueue.main.async {
                    self.window?.rootViewController?.showLoginViewController()
                }
            default:
                break
            }
        }
        return true
    }

}

