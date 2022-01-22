//
//  HomeViewController.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 10/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var segmentView:CustomSegmentView = {
        let v = CustomSegmentView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(TopGamesCollectionViewCell.self, forCellWithReuseIdentifier: "TopGamesCollectionViewCell")
        cv.register(NextGamesCollectionViewCell.self, forCellWithReuseIdentifier: "NextGamesCollectionViewCell")
        cv.backgroundColor = .white
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(segmentView)
        segmentView.backgroundColor = .purple
        view.addSubview(collectionView)
        setUpCustomNavBar()
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            segmentView.topAnchor.constraint(equalTo: view.topAnchor),
            segmentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            segmentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            segmentView.heightAnchor.constraint(equalToConstant: 80),
            
            collectionView.topAnchor.constraint(equalTo: segmentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setUpCustomNavBar(){
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        //MARK:- search Button
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        let rightBarButtonItem1 = UIBarButtonItem()
        rightBarButtonItem1.customView = searchButton
        
        //MARK:- home Button
        let homeButton = UIButton(type: .system)
        homeButton.setImage(UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), for: .normal)
        homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        homeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: homeButton)
        let rightBarButtonItem2 = UIBarButtonItem()
        rightBarButtonItem2.customView = homeButton
        
        navigationItem.setRightBarButtonItems([rightBarButtonItem2, rightBarButtonItem1], animated: true)
        
        //MARK:- Title
        let title = UILabel()
        title.text = "  Lusaxgames"
        title.textColor = CustomColor.appBlack
        title.font = UIFont(name: CustomFont.RalewayBold, size: 20)
        let leftBarButtonItem = UIBarButtonItem()
        leftBarButtonItem.customView = title
        
        navigationItem.setLeftBarButtonItems([leftBarButtonItem], animated: true)
    }
    
    @objc func homeButtonPressed(){
    }

}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, gameCardProtocol {
    
    func didGameCardTapped() {
        let VC = DetailViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopGamesCollectionViewCell", for: indexPath) as! TopGamesCollectionViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextGamesCollectionViewCell", for: indexPath) as! NextGamesCollectionViewCell
            cell.delegate = self
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width, height: 360)
        } else {
            return CGSize(width: collectionView.frame.width, height: 270 + 70)
        }
    }
    
}
