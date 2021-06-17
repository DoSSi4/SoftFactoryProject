//
//  RegistrationViewController.swift
//  softfactory
//
//  Created by DoSSi4 on 18.06.2021.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passTxtFld: UITextField!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var surnameTxtFld: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func regAction(_ sender: Any) {
        guard let email = emailTxtFld.text else {return}
        guard let password = passTxtFld.text else {return}
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                let alert = UIAlertController(title: "An error occured!", message: "Response: \(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                self.dismiss(animated: true, completion: nil)
                UserDefaults.standard.setValue(self.nameTxtFld.text, forKey: "name")
                UserDefaults.standard.setValue(self.surnameTxtFld.text, forKey: "surname")
            }
        }

    }
    @IBAction func goBacktoLogin(){
        self.dismiss(animated: true, completion: nil)
    }
    

}
