//
//  HomeCardViewCell.swift
//  MysteryLog
//
//  Created by Satoshi Yokokawa on 2021/06/22.
//

import UIKit

class HomeCardViewCell: UICollectionViewCell {

    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 12
    }

}
