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
    let screenRect = UIScreen.main.bounds
    @IBOutlet weak var myMysteryTableView: UITableView!
    @IBOutlet weak var homeCardView: UICollectionView!
    @IBOutlet weak var homeCardCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    var cellOffset: CGFloat!
    var navHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        edgesForExtendedLayout = []
        setupViews()
    }
    
    private func setupViews() {
        myMysteryTableView.tableFooterView = UIView()
        myMysteryTableView.delegate = self
        myMysteryTableView.dataSource = self
        myMysteryTableView.frame = CGRect(x: 0, y: 0, width: screenRect.width, height: screenRect.height)
//        homeCardView.frame = CGRect(x: 0, y: 0, width: screenRect.width-20, height: homeCardView.frame.height)
            
//        self.parent?.navigationItem.title = "Main"
        self.navigationController?.navigationBar.barTintColor = .rgb(red: 39, green: 49, blue: 69)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        viewWidth = view.frame.width
        viewHeight = view.frame.height
        navHeight = self.navigationController?.navigationBar.frame.size.height

        homeCardView.delegate = self
        homeCardView.dataSource = self
        let homeCardnib = UINib(nibName: "HomeCardViewCell", bundle: .main)
        homeCardView.register(homeCardnib, forCellWithReuseIdentifier: "homeCardCell")
        let tableCardnib = UINib(nibName: "HomeTableCardViewCell", bundle: .main)
        myMysteryTableView.register(tableCardnib, forCellReuseIdentifier: cellID)
        
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
        
        print("debug:tableViewWidth" ,self.myMysteryTableView.frame.size.width)

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
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 12
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowRadius = 12
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 8, height: 8)
        cell.layer.masksToBounds = false
        print("debug:cell.image width \(cell.backgroundImageView.layer.frame.height)")
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            cellWidth = viewWidth-30
            cellHeight = viewHeight-300
            cellOffset = viewWidth-cellWidth
        print("debug:cell width is \(cellWidth!)")
        print("debug:cell Height is \(cellHeight!)")
            return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top:  navHeight-30,left: cellOffset/2,bottom: 0,right: cellOffset/2)
        }

}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // セルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // セルのあれこれ設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myMysteryTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.layer.masksToBounds = false
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
}

