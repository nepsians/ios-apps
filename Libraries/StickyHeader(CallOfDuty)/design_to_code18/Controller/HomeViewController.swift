//
//  HomeViewController.swift
//  design_to_code18
//
//  Created by Dheeraj Kumar Sharma on 08/09/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tableView:UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(GameOverviewTableViewCell.self, forCellReuseIdentifier: "GameOverviewTableViewCell")
        tv.register(GameRatingsTableViewCell.self, forCellReuseIdentifier: "GameRatingsTableViewCell")
        tv.register(UpdatesTableViewCell.self, forCellReuseIdentifier: "UpdatesTableViewCell")
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    lazy var navBar:CustomNavBar = {
        let v = CustomNavBar()
        v.controller = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowRadius = 10
        v.layer.shadowColor = UIColor(white: 0, alpha: 0.1).cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: 10)
        return v
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(navBar)
        tableView.pin(to: view)
        setUpConstraints()
        
        let headerView = StrechyHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250))
        headerView.imageView.image = UIImage(named: "cover")
        self.tableView.tableHeaderView = headerView
        navBar.alpha = 0
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameOverviewTableViewCell", for: indexPath) as! GameOverviewTableViewCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.frame.width)
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameRatingsTableViewCell", for: indexPath) as! GameRatingsTableViewCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpdatesTableViewCell", for: indexPath) as! UpdatesTableViewCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        }
        if indexPath.row == 1 {
            return 75
        }
        if indexPath.row == 2 {
            return 680
        }
        return CGFloat()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableView.tableHeaderView as! StrechyHeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
        
        let y = scrollView.contentOffset.y
        let v = y/210
        let value = Double(round(100*v)/100)
        print(value)
        // It return 1 when header end reaches the height of navbar which is 160.
        
        if value >= 1.0 {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
                self.navBar.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4) {
                self.navBar.gameThumbImage.transform = CGAffineTransform(translationX: 0, y: 0)
                self.navBar.getButton.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
                self.navBar.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.4) {
                self.navBar.gameThumbImage.transform = CGAffineTransform(translationX: 0, y: +50)
                self.navBar.getButton.transform = CGAffineTransform(translationX: 0, y: +50)
            }
        }
    }
    
}
