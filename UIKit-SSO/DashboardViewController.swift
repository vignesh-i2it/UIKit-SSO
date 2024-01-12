//
//  DashboardViewController.swift
//  UIKit-SSO
//
//  Created by Vignesh on 10/01/24.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var userIdentifierLabel: UILabel!
    @IBOutlet weak var givenNameLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdentifierLabel.text = KeychainItem.currentUserIdentifier
    }
    
    @IBAction func signOutButtonPressed() {
        KeychainItem.deleteUserIdentifierFromKeychain()
        
        DispatchQueue.main.async {
            self.showLoginViewController()
        }
    }
}
