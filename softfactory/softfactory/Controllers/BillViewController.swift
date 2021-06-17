//
//  BillViewController.swift
//  softfactory
//
//  Created by DoSSi4 on 29.04.2021.
//

import UIKit

class BillViewController: UIViewController {
    
    var dishes = ["Soup", "Pasta", "Burrito", "Taco", "Lemonade", "Soda", "Pepsi","Steak", "Water", "Lasagna", "Burger"]
    var prices = [12, 14, 32, 43, 54, 17, 19, 23, 31, 22, 6, 5, 4, 8, 9]
    @IBOutlet weak var tableView: UITableView!
    var totalAmount = Int.random(in: 27...256)
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: BillCell.identifier, bundle: nil), forCellReuseIdentifier: BillCell.identifier)
        self.totalLabel.text = "Total: \(totalAmount)$ to pay"
        UserDefaults.standard.setValue(totalAmount, forKey: "totalAmount")
        
    }
    @IBAction func splitCheck(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "SplitViewController") as! SplitViewController
       
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func PayFull(){
        let action = UIAlertController(title: "Success!", message: "Your request sended", preferredStyle: .alert)
        action.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in self.navigationController?.popToRootViewController(animated: true)}))
        self.present(action, animated: true)
    }
}
extension BillViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 3...10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BillCell.identifier, for: indexPath) as! BillCell
        cell.dishLabel.text = dishes.randomElement()
        cell.priceLabel.text = "\(prices.randomElement()!)"
        
        return cell
    }
    
    
}
