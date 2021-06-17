//
//  HomeViewController.swift
//  softfactory
//
//  Created by DoSSi4 on 18.05.2021.
//

import UIKit

class HomeViewController: UIViewController, UITabBarDelegate {
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var welcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.delegate = self
       
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let loginCheck = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if !loginCheck{
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            present(vc, animated: true)
        }
        let username = UserDefaults.standard.string(forKey: "name")
        welcome.text = "Welcome, \(username ?? "User")!"
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
         if (item.tag == 2){
            let vc = storyboard?.instantiateViewController(withIdentifier: "BillViewController") as! BillViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else if (item.tag == 3){
            let vc = storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
            navigationController?.pushViewController(vc, animated: true)
    }
       
        }
    @IBAction func goToLogin(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
