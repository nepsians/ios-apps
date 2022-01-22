//
//  ViewController.swift
//  AppWithoutStoryBoard
//
//  Created by Nihal on 12/5/20.
//

import UIKit

class HomeScreenController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    let homeView: HomeView = {
        let mainView = HomeView()
        return mainView
    }()
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .darkGray
//        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
////
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(handleMenuToggle))
        let leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(handleMenuToggle))
        leftBarButtonItem.tintColor = .white
        navigationItem.setLeftBarButtonItems([leftBarButtonItem], animated: true)
        homeView.homeViewController = self
//
//        let backBtn = UIButton(type: .system)
//        backBtn.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        backBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
//        backBtn.addTarget(self, action: #selector(handleMenuToggle), for: .touchUpInside)
//        let leftBarButtonItem = UIBarButtonItem()
//        leftBarButtonItem.customView = backBtn
        
        //navigationItem.setLeftBarButtonItems([leftBarButtonItem], animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Home"
    }
}

