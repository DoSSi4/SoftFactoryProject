//
//  SplitViewController.swift
//  softfactory
//
//  Created by DoSSi4 on 18.05.2021.
//

import UIKit

class SplitViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var firstperson: UIStackView!
    @IBOutlet weak var secondperson: UIStackView!
    @IBOutlet weak var thirdperson: UIStackView!
    @IBOutlet weak var fourthperson: UIStackView!
    @IBOutlet weak var fifthperson: UIStackView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var firstCash: UITextField!
    @IBOutlet weak var secondCash: UITextField!
    @IBOutlet weak var thirdCash: UITextField!
    @IBOutlet weak var fourthCash: UITextField!
    @IBOutlet weak var fifthCash: UITextField!
    var totalAmount: Int!
    var eachPersonCash: Int!
    var pickerData = ["Split for two person","Split for three person", "Split for four person", "Split for five person"]
    override func viewDidLoad() {
        super.viewDidLoad()
        totalAmount = UserDefaults.standard.integer(forKey: "totalAmount") + 10
        totalLabel.text = "Total     \(totalAmount ?? 0) $"
        secondperson.isHidden = false
        thirdperson.isHidden = true
        fourthperson.isHidden = true
        fifthperson.isHidden = true
        pickerView.dataSource = self
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func continueSplit(){
        let action = UIAlertController(title: "Success", message: "Your pay request has been sended, proceed to main menu...", preferredStyle: .alert)
        action.addAction(UIAlertAction(title: "Proceed", style: .default, handler: {_ in self.view.window!.rootViewController?.dismiss(animated: true)}))
        self.present(action, animated: true)
    }
    

}
extension SplitViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row{
        case 0:
            firstperson.isHidden = false
            secondperson.isHidden = false
            thirdperson.isHidden = true
            fourthperson.isHidden = true
            fifthperson.isHidden = true
            eachPersonCash = totalAmount / 2
            firstCash.text = "\(eachPersonCash ?? 0)$"
            secondCash.text = "\(eachPersonCash ?? 0)$"
            
        case 1:
            firstperson.isHidden = false
            secondperson.isHidden = false
            thirdperson.isHidden = false
            fourthperson.isHidden = true
            fifthperson.isHidden = true
            eachPersonCash = totalAmount / 3
            firstCash.text = "\(eachPersonCash ?? 0)$"
            secondCash.text = "\(eachPersonCash ?? 0)$"
            thirdCash.text = "\(eachPersonCash ?? 0)$"
        case 2:
            firstperson.isHidden = false
            secondperson.isHidden = false
            thirdperson.isHidden = false
            fourthperson.isHidden = false
            fifthperson.isHidden = true
            eachPersonCash = totalAmount / 4
            firstCash.text = "\(eachPersonCash ?? 0)$"
            secondCash.text = "\(eachPersonCash ?? 0)$"
            thirdCash.text = "\(eachPersonCash ?? 0)$"
            fourthCash.text = "\(eachPersonCash ?? 0)$"
        case 3:
            firstperson.isHidden = false
            secondperson.isHidden = false
            thirdperson.isHidden = false
            fourthperson.isHidden = false
            fifthperson.isHidden = false
            eachPersonCash = totalAmount / 5
            firstCash.text = "\(eachPersonCash ?? 0)$"
            secondCash.text = "\(eachPersonCash ?? 0)$"
            thirdCash.text = "\(eachPersonCash ?? 0)$"
            fourthCash.text = "\(eachPersonCash ?? 0)$"
            fifthCash.text = "\(eachPersonCash ?? 0)$"
        default:
            firstperson.isHidden = false
            secondperson.isHidden = false
            eachPersonCash = totalAmount / 2
            firstCash.text = "\(eachPersonCash ?? 0)$"
            secondCash.text = "\(eachPersonCash ?? 0)$"
            
            
        }
    }
    
    
}
