//
//  LoggedInUserViewController.swift
//  Facebook Login
//
//  Created by Aaqib Hussain on 01/03/2016.
//  Copyright © 2016 Aaqib Hussain. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoggedInUserViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
       self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func logout(sender: AnyObject) {
        
        if FBSDKAccessToken.currentAccessToken() != nil {
            let logout = FBSDKLoginManager()
            logout.logOut()
           
        }
    }
}
