//
//  ViewController.swift
//  MysteryLogApp
//
//  Created by Satoshi Yokokawa on 2021/06/21.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController{
    
    private let cellID = "cellID"
    let cellSpacingHeight: CGFloat = 5
    
    @IBOutlet weak var myMysteryTableView: UITableView!
    @IBOutlet weak var homeCardView: UICollectionView!
    
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMysteryTableView.delegate = self
        myMysteryTableView.dataSource = self
        edgesForExtendedLayout = []
        setupViews()
    }
    
    private func setupViews() {
        myMysteryTableView.tableFooterView = UIView()
        myMysteryTableView.delegate = self
        myMysteryTableView.dataSource = self
//        self.parent?.navigationItem.title = "Main"
        self.navigationController?.navigationBar.barTintColor = .rgb(red: 39, green: 49, blue: 69)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height

        homeCardView.delegate = self
        homeCardView.dataSource = self
//        homeCardView.layer.cornerRadius = 15
        
        let nib = UINib(nibName: "HomeCardViewCell", bundle: .main)
        homeCardView.register(nib, forCellWithReuseIdentifier: "homeCardCell")
        //スクロールバーを削除する
        self.myMysteryTableView.showsVerticalScrollIndicator = false;
        self.homeCardView.showsHorizontalScrollIndicator = false;
        
        //背景色
        //グラデーションの開始色
        let topColor = UIColor(red:0.07, green:0.13, blue:0.26, alpha:1)
        //グラデーションの開始色
        let bottomColor = UIColor(red:0.54, green:0.74, blue:0.74, alpha:1)

        //グラデーションの色を配列で管理
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]

        //グラデーションレイヤーを作成
        let gradientLayer: CAGradientLayer = CAGradientLayer()

        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        //グラデーションレイヤーをスクリーンサイズにする
        gradientLayer.frame = self.view.bounds

        //グラデーションレイヤーをビューの一番下に配置
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        

//
//        let rigntBarButton = UIBarButtonItem(title: "新規チャット", style: .plain, target: self, action: #selector(tappedNavRightBarButton))
////        let logoutBarButton = UIBarButtonItem(title: "ログアウト", style: .plain, target: self, action: #selector(tappedLogoutButton))
//        navigationItem.rightBarButtonItem = rigntBarButton
//        navigationItem.rightBarButtonItem?.tintColor = .white
//        navigationItem.leftBarButtonItem = logoutBarButton
//        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCardCell", for: indexPath) as! HomeCardViewCell
//        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowRadius = 12
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 8, height: 8)
        cell.layer.masksToBounds = false
//        cell.titleLabel.text = "\(titleArray[indexPath.row])への旅"
//        cell.dateLabel.text = "06/08~06/15"
//        cell.backgroundImageView.image = UIImage(named: photoArray[indexPath.row])
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            cellWidth = viewWidth-20
            cellHeight = viewHeight-200
            cellOffset = viewWidth-cellWidth
            return CGSize(width: cellWidth, height: cellHeight)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -navHeight,left: cellOffset/2,bottom: 0,right: cellOffset/2)
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // 普通はここで表示したいセルの数を返すが、セクションのヘッダーとフッターでスペーシングしているので、固定で1を返す
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 44 // 適当なセルの高さ
        }
    private func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 5 // セルの上部のスペース
    }
    private func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5 // セルの下部のスペース
    }
    private func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            view.tintColor = UIColor.clear // 透明にすることでスペースとする
    }
    private func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
            view.tintColor = UIColor.clear // 透明にすることでスペースとする
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myMysteryTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        // add border and color
        cell.layer.cornerRadius = 20
        // radius & shadow
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
        cell.backgroundColor = UIColor.white
        cell.clipsToBounds = true
        return cell
    }
}

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mysteryImageView: UIImageView!
    @IBOutlet weak var result: UIButton!
    @IBOutlet weak var mysteryTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//           backgroundColor = .clear
        mysteryImageView.layer.cornerRadius = 20
    }
    
    @IBAction func resultSet(_ sender: Any) {
        addMenuToButton()
    }
    
    func addMenuToButton(){
        let addCat = UIAction(title: "成功", image: UIImage(systemName: "plus")) { (action) in
            print("猫を追加")
        }
        let shareButton = UIAction(title: "失敗", image: UIImage(systemName: "paperplane")) { (action) in print("リストを共有")
        }
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [addCat, shareButton])
        result.menu = menu
        result.showsMenuAsPrimaryAction = true
    }
    static let paddingBottom : CGFloat = 15
    static let paddingRight : CGFloat = 10
    static let paddingLeft : CGFloat = 10
    static let height : CGFloat = 478 + paddingBottom
    
    class func getHeight() -> CGFloat {
        return 518
    }

    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.size.height -= HomeTableViewCell.paddingBottom
            frame.size.width -= HomeTableViewCell.paddingRight
            frame.size.width -= HomeTableViewCell.paddingLeft
            super.frame = frame
        }
    }
}
