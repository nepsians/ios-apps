//
//  CreateTaskViewController.swift
//  ToDoProject
//
//  Created by BentRay on 03/04/2021.
//

import UIKit
import CoreData

struct CreateTaskStucture {
    static var type:String!
    static var title:String!
    static var entity:ToDoEntity!
}

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskHeading: UILabel!
    @IBOutlet weak var taskTxt: UITextView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName:"ToDoEntity")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(CreateTaskStucture.type == "Update")
        {
            self.taskHeading.text = "Update Task"
            self.taskTxt.text = CreateTaskStucture.title
        }
        else
        {
            self.taskHeading.text = "Add New Task"
        }
        
    }
    
    @IBAction func actionDone(_ sender: Any) {
        
        //current date and time
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = df.string(from: date)
        
        if(CreateTaskStucture.type == "Update")
        {
            updateTask(newTask: self.taskTxt.text, task: CreateTaskStucture.entity)
        }else
        {
            insertData(name: self.taskTxt.text!, date: dateString, status: false)
        }
   
    }
    
    func updateTask(newTask:String,task:ToDoEntity)
    {
        task.name = newTask
        do {
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addTask"), object: nil)
            displayAlertMessage(userMessage: "Updated Successfully", myView: self)
        } catch {
            displayAlertMessage(userMessage: "Some Error Occured!", myView: self)
        }
    }
    
    func insertData(name:String,date:String,status:Bool)
    {
        let newData = ToDoEntity(context: context )
        newData.name = name
        newData.date = date
        newData.status = status
        
        do
        {
            try context.save()
            self.taskTxt.text = ""
            displayAlertMessage(userMessage: "Task Created Successfully!", myView: self)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addTask"), object: nil)
        }
        catch
        {
            displayAlertMessage(userMessage: "Some error occured!", myView: self)
        }
    }
}
