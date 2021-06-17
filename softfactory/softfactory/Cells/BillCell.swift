//
//  BillCell.swift
//  softfactory
//
//  Created by DoSSi4 on 18.06.2021.
//

import UIKit

class BillCell: UITableViewCell {
    let bill = BillViewController()
    public static let identifier = "BillCell"
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
