//
//  MysteryListViewCell.swift
//  MysteryLog
//
//  Created by Satoshi Yokokawa on 2021/06/26.
//

import UIKit

class MysteryListViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.layer.cornerRadius = 12
    }

}
