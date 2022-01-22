//
//  DetailViewController.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 11/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(DetailTrailerCollectionViewCell.self, forCellWithReuseIdentifier: "DetailTrailerCollectionViewCell")
        cv.register(IntroCollectionViewCell.self, forCellWithReuseIdentifier: "IntroCollectionViewCell")
        cv.backgroundColor = .white
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.pin(to: view)
        setUpCustomNavBar()
    }
    
    func setUpCustomNavBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        //MARK:- search Button
        let shareBtn = UIButton(type: .system)
        shareBtn.setImage(UIImage(named: "share")?.withRenderingMode(.alwaysOriginal), for: .normal)
        shareBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareBtn)
        let rightBarButtonItem1 = UIBarButtonItem()
        rightBarButtonItem1.customView = shareBtn
        
        //MARK:- home Button
        let homeButton = UIButton(type: .system)
        homeButton.setImage(UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), for: .normal)
        homeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: homeButton)
        let rightBarButtonItem2 = UIBarButtonItem()
        rightBarButtonItem2.customView = homeButton
        
        navigationItem.setRightBarButtonItems([rightBarButtonItem2, rightBarButtonItem1], animated: true)
        
        //MARK:- back Button
        let backBtn = UIButton(type: .system)
        backBtn.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = backBtn
        
        navigationItem.setLeftBarButtonItems([leftBarButtonItem], animated: true)
    }
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }

}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailTrailerCollectionViewCell", for: indexPath) as! DetailTrailerCollectionViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCollectionViewCell", for: indexPath) as! IntroCollectionViewCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width, height: 330)
        }
        if indexPath.row == 1 {
            return CGSize(width: collectionView.frame.width, height: 600)
        }
        return CGSize()
    }
    
}
