//
//  DetailScreenViewController.swift
//  AppWithoutStoryBoard
//
//  Created by Nihal on 12/5/20.
//

import UIKit

import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class DetailScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Details"
        
        navigationController?.navigationBar.topItem?.title = ""
//
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let estimatedFrame = CGRect(x: 0, y: 20, width: self.view.frame.width - 50, height: 30)
        let textField = MDCOutlinedTextField(frame: estimatedFrame)
        textField.label.text = "Phone number"
        textField.placeholder = "555-555-5555"
        textField.leadingAssistiveLabel.text = "This is helper text"
        textField.sizeToFit()
        view.addSubview(textField)
    }
  
}
