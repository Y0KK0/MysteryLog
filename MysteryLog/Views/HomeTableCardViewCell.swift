//
//  HomeTableCardViewCell.swift
//  MysteryLog
//
//  Created by Satoshi Yokokawa on 2021/06/23.
//

import UIKit

class HomeTableCardViewCell: UITableViewCell {

    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var tableBack: UIImageView!
    @IBOutlet weak var level1: UIImageView!
    @IBOutlet weak var level2: UIImageView!
    @IBOutlet weak var level3: UIImageView!
    @IBOutlet weak var level4: UIImageView!
    @IBOutlet weak var level5: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableBack.layer.cornerRadius = 12
        backgroundColor = .clear
        tableBack.layer.backgroundColor = UIColor.white.cgColor
        let randomInt = Int.random(in: 1..<6)
        if randomInt >= 1{
            level1.image  = UIImage(systemName: "questionmark.circle.fill")
        }
        if randomInt >= 2{
            level2.image  = UIImage(systemName: "questionmark.circle.fill")
        }
        if randomInt >= 3{
            level3.image  = UIImage(systemName: "questionmark.circle.fill")
        }
        if randomInt >= 4{
            level4.image  = UIImage(systemName: "questionmark.circle.fill")
        }
        if randomInt >= 5{
            level5.image  = UIImage(systemName: "questionmark.circle.fill")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
