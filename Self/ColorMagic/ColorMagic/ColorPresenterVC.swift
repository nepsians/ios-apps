//
//  ColorPresenterVC .swift
//  ColorMagic
//
//  Created by Nihal on 12/1/20.
//

import UIKit

class ColorPresenterVC: UIViewController, ColorTransferDelegate {
 
    @IBOutlet weak var colorNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func navToColorScreen(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ColorPickerVC") as! ColorPickerVC
        resultViewController.delegate=self;
        self.navigationController?.pushViewController(resultViewController, animated: true)

        //        let navVC = UINavigationController(rootViewController:                resultViewController)
        //        navVC.modalPresentationStyle = .fullScreen
        //        present(navVC, animated: true, completion: nil)
        
        //        let colorPickerVC = ColorPickerVC()
        //        colorPickerVC.delegate = self
        //       self.present(colorPickerVC, animated: true, completion: nil)

    }

    @IBAction func onButtonPressed(_ sender: Any) {
        navToColorScreen();
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "presentColorPickerVC"){
//            print(segue.destination)
//            print(ColorPickerVC())
//            guard let colorPickerVC = segue.destination as? ColorPickerVC else { return }
//            colorPickerVC.delegate = self
//        }
//    }
    
    func userDidChoose(color: UIColor, colorName: String) {
        view.backgroundColor = color
        colorNameLbl.text = colorName
    }
    

}

