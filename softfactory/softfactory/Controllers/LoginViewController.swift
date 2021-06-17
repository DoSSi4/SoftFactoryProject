//
//  LoginViewController.swift
//  softfactory
//
//  Created by DoSSi4 on 18.06.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LoginAction(_ sender: Any) {
        guard let email = phoneTextField.text else {return}
        guard let password = passTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error{
                print("Something went wrong: \(error)")
            }else {
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
                UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
            }
        }
        
    }
    @IBAction func goToRegistration(_ sender: Any) {
        self.performSegue(withIdentifier: "goToReg", sender: self)
    }
}
