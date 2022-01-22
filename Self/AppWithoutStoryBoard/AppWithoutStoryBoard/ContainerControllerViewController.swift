//
//  ContainerControllerViewController.swift
//  AppWithoutStoryBoard
//
//  Created by Nihal on 12/6/20.
//

import UIKit

class ContainerControllerViewController: UIViewController {
    
    var menuContainer: UIViewController!
    var centerController: UIViewController!
    var isExpaneded = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configureController();
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configureController(){
        let homeController = HomeScreenController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
    func configureMenuController(){
        if menuContainer == nil{
            menuContainer = MenuController()
            view.insertSubview(menuContainer.view, at: 0)
            addChild(menuContainer)
            menuContainer.didMove(toParent: self)
            print("did add menu controller...")
        }
    }
    
    func showMenuController(shouldMenuExpand: Bool){
        if(shouldMenuExpand){
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x =  self.centerController.view.frame.width - 80
            }, completion: nil)
        }else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x =  0
            }, completion: nil)
        }
    }

}

extension ContainerControllerViewController: HomeControllerDelegate{
    func handleMenuToggle() {
        if !isExpaneded{
            configureMenuController()
        }
    
        isExpaneded = !isExpaneded
        showMenuController(shouldMenuExpand: isExpaneded)
    }
}
