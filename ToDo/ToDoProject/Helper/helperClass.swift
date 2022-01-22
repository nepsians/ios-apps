//
//  helperClass.swift
//  ToDoProject
//
//  Created by BentRay on 03/04/2021.
//

import Foundation
import UIKit

func displayAlertMessage(userMessage:String, myView:UIViewController)
{
    let myAlert=UIAlertController(title:"Sync Simple",message:userMessage, preferredStyle:UIAlertController.Style.alert);
    let okAction=UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil)
    myAlert.addAction(okAction)
    myView.present(myAlert,animated:true, completion: nil)
}
