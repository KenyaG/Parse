//
//  ProfileViewController.swift
//  Parsegram
//
//  Created by Kenya Gordon on 6/21/16.
//  Copyright © 2016 Kenya Gordon. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func OnSignOut(sender: AnyObject) {
        
        PFUser.logOut()
        let currentUser = PFUser.currentUser()
        if currentUser == nil { print("User is logged out")}
        self.performSegueWithIdentifier("logoutSegue", sender: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
