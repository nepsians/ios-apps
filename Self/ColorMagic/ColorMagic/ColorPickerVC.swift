//
//  ColorPickerVC.swift
//  ColorMagic
//
//  Created by Nihal on 12/1/20.
//

import UIKit

class ColorPickerVC: UIViewController {
    
    var delegate: ColorTransferDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(sender: UIButton){
        if(delegate != nil){
            let text = sender.titleLabel?.text ?? "Empty";
        
            delegate?.userDidChoose(color: sender.backgroundColor ?? UIColor.red, colorName: text)
        
            self.navigationController?.popViewController(animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
