//
//  HomeTableCardViewCell.swift
//  MysteryLog
//
//  Created by Satoshi Yokokawa on 2021/06/23.
//

import UIKit

class HomeTableCardViewCell: UITableViewCell {

    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var tableBack: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableBack.layer.cornerRadius = 12
        backgroundColor = .clear
        tableBack.layer.backgroundColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
