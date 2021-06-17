//
//  AccountViewController.swift
//  softfactory
//
//  Created by DoSSi4 on 18.05.2021.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "isLoggedIn"){
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            present(vc, animated: true, completion: nil)
        }
        username.text = "\(defaults.string(forKey: "name") ?? "User") \(defaults.string(forKey: "surname") ?? "User")"
    }


}
