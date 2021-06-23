//
//  HomeCardViewCell.swift
//  MysteryLog
//
//  Created by Satoshi Yokokawa on 2021/06/22.
//

import UIKit

class HomeCardViewCell: UICollectionViewCell {

    @IBOutlet weak var clearRatio: UILabel!
    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        clearRatio.text = "50%"
        backgroundImageView.layer.cornerRadius = 12
    }

}
