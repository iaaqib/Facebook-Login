//
//  ViewController.swift
//  Facebook Login
//
//  Created by Aaqib Hussain on 29/02/2016.
//  Copyright © 2016 Aaqib Hussain. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "profileUpdated:", name: FBSDKProfileDidChangeNotification, object: nil)
    }
    @IBAction func loginButton(sender: AnyObject) {
        
        let login: FBSDKLoginManager = FBSDKLoginManager()
        login.logInWithReadPermissions(["public_profile","email","user_friends"], fromViewController: self) { (result: FBSDKLoginManagerLoginResult!, error) -> Void in
            
            
            
            if ((error) != nil)
            {
                // Process error
            }
            else if result.isCancelled {
                // Handle cancellations
                
            }
            else {
                
                
                    self.performSegueWithIdentifier("login", sender: nil)
                    
                
            }

        
        }
    }
        
    
    func profileUpdated(notification: NSNotification) {
        
        if FBSDKAccessToken.currentAccessToken() != nil{
            let name = FBSDKProfile.currentProfile().name
            let uid = FBSDKProfile.currentProfile().userID
            let fname = FBSDKProfile.currentProfile().firstName
            let lname = FBSDKProfile.currentProfile().lastName
            let pplink = FBSDKProfile.currentProfile().imageURLForPictureMode(FBSDKProfilePictureMode.Square, size: CGSize(width: 400,height: 400))
            
            
            print("name:\(name)")
            print("User ID:\(uid)")
            print("first\(fname)")
            print("last:\(lname)")
            print("image:\(String(pplink))")
            self.getUserEmail()
        }
        else {
            
            
            print("logged out")
            
        }
        
        
    }
    
    func getUserEmail()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters:["fields": "email"], HTTPMethod: "GET")
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                //  let userName : NSString = result.valueForKey("name") as! NSString
                //  print("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                let email = userEmail as String
                print("User Email is: \(email)")
            }
        })
    }
    

     @IBAction func returnOnLogout(storyboard: UIStoryboardSegue){
    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

