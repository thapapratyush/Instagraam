//
//  LoginViewController.swift
//  Instagram
//
//  Created by Pratyush Thapa on 2/26/17.
//  Copyright © 2017 Pratyush Thapa. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    let OKAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func onSignin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                self.usernameField.text = ""
                self.passwordField.text = ""
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let alertController = UIAlertController(title: "Error", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                alertController.addAction(self.OKAction)
                self.present(alertController, animated: true) {}
            }
        }
    }
    @IBAction func onSignup(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                self.usernameField.text = ""
                self.passwordField.text = ""
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("error: \(error?.localizedDescription)")
                let alertController = UIAlertController(title: "Error", message: "\(error!.localizedDescription)", preferredStyle: .alert)
                alertController.addAction(self.OKAction)
                self.present(alertController, animated: true) {}
            }
        }
        
    }
    
    @IBAction func unwindToLogin (segue: UIStoryboardSegue) {}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
