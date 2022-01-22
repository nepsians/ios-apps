//
//  ViewController.swift
//  ToDoProject
//
//  Created by BentRay on 03/04/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ListTableViewDelegates,UISearchBarDelegate {
   
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    let cellIdentifier = "ListCell"
    @IBOutlet weak var tableview: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName:"ToDoEntity")
    private var models = [ToDoEntity]()
    var filterdata = [ToDoEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.searchBar.delegate = self
        
        getData()
        
        self.tableview.estimatedRowHeight = 80
        self.tableview.rowHeight = UITableView.automaticDimension
        
        //for refreshing the data after adding new Task
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshData), name: NSNotification.Name(rawValue: "addTask"), object: nil)
        
        //for today's day
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "EEEE dd MMMM"
        let dateString = df.string(from: date)
        self.todayLabel.text = dateString
        
    }
    
    @objc func dismissKeyboard() {
      view.endEditing(true)
    }
    
    @objc func refreshData()
    {
        getData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filterdata = models
        } else {
                      // Filter the results
            filterdata = models.filter{ $0.name!.contains(searchText) || $0.date!.contains(searchText)}
        }
        self.tableview.reloadData()
    }


    @IBAction func actionAddTask(_ sender: Any) {
        
        CreateTaskStucture.type = "Create"
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateTask") as! CreateTaskViewController
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
        
    }
    
    //tableview Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: cellIdentifier) as! ListTableViewCell
        self.filterdata.sort { $0.done < $1.done }
        let item = filterdata[indexPath.row]
        cell.titleLabel.text = item.name
        
        //Check if today/yesterday
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateOnly = item.date?.prefix(10)
        let timeOnly = item.date?.suffix(8)
        
        let dateString = String(dateOnly!)
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"

        let timeFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "HH:mm:ss"

        let timeFormatterPrint = DateFormatter()
        timeFormatterPrint.dateFormat = "h:mm a"
        
        if calendar.isDateInYesterday(dateFormatter.date(from: (item.date)!)!)
        {
            
            if let times = dateFormatter.date(from: String(timeOnly!)) {
                cell.dateLabel.setTitle("Yesterday" + " at " + timeFormatterPrint.string(from: times), for: .normal)
            } else {
                cell.dateLabel.setTitle("Yesterday" + " at " + timeOnly!, for: .normal)
            }
            
        }
        if calendar.isDateInToday(dateFormatter.date(from: (item.date)!)!)
        {
            if let times = dateFormatter.date(from: (item.date)!) {
                cell.dateLabel.setTitle("Today" + " at " + timeFormatterPrint.string(from: times), for: .normal)
            } else {
              
                cell.dateLabel.setTitle("Today" + " at " + timeOnly!, for: .normal)
            }
        }
        else
        {
            if let dates = dateFormatter.date(from: (item.date)!) {

                if let times = dateFormatter.date(from: (item.date)!) {
                    cell.dateLabel.setTitle(dateFormatterPrint.string(from: dates) + " at " + timeFormatterPrint.string(from: times), for: .normal)
                } else {

                    cell.dateLabel.setTitle(dateFormatterPrint.string(from: dates) + " at " + timeOnly!, for: .normal)
                }

            } else {

                cell.dateLabel.setTitle(item.date, for: .normal)
            }
        }
        
        
        
        if(item.status == true)
        {
            cell.statusButton.imageView?.image = UIImage(systemName: "star.fill")
            cell.statusButton.tintColor = UIColor.systemOrange
        }
        else
        {
            cell.statusButton.imageView?.image = UIImage(systemName: "star")
            cell.statusButton.tintColor = UIColor.gray
        }
        
        if(item.done == 1)
        {
            cell.checkBoxButton.imageView?.image = UIImage(systemName: "checkmark.circle.fill")
        }
        else
        {
            cell.checkBoxButton.imageView?.image = UIImage(systemName: "circle")
        }
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
     
            let myAlert=UIAlertController(title:"ToDo",message:"Are you sure you want to delete this task?", preferredStyle:UIAlertController.Style.alert);
            let okAction=UIAlertAction(title:"Yes", style:UIAlertAction.Style.default, handler: { action in
                let selectedItem = self.filterdata[indexPath.row]
                self.removeData(data: selectedItem)
            })
            let cancelAction=UIAlertAction(title:"No", style:UIAlertAction.Style.cancel, handler: nil)
            myAlert.addAction(okAction)
            myAlert.addAction(cancelAction)
            self.present(myAlert,animated:true, completion: nil)
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        CreateTaskStucture.type = "Update"
        CreateTaskStucture.title = filterdata[indexPath.row].name
        CreateTaskStucture.entity = filterdata[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateTask") as! CreateTaskViewController
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    func actionStatus(_ sender: ListTableViewCell) {
        
        guard let tappedIndexPath = tableview.indexPath(for: sender) else { return }
        let buttonStatus = filterdata[tappedIndexPath.row].status
        if(buttonStatus == true)
        {
            self.updateStatus(status: false, task: filterdata[tappedIndexPath.row])
        }
        else
        {
            self.updateStatus(status: true, task: filterdata[tappedIndexPath.row])
        }
    }
    
    func actionCheckBox(_ sender: ListTableViewCell) {
        guard let tappedIndexPath = tableview.indexPath(for: sender) else { return }
        let buttonStatus = filterdata[tappedIndexPath.row].done
        if(buttonStatus == 0)
        {
            self.updateCheckBox(check: 1, task: filterdata[tappedIndexPath.row])
        }
        else
        {
            self.updateCheckBox(check: 0, task: filterdata[tappedIndexPath.row])
        }
    }
    
    
    
    //for coredata access
    func updateCheckBox(check:Int16,task:ToDoEntity)
    {
        task.done = check
        do {
            try context.save()
            DispatchQueue.main.async {
                self.getData()
            }
        } catch {
            displayAlertMessage(userMessage: "Some Error Occured!", myView: self)
        }
    }
    
    
    func updateStatus(status:Bool,task:ToDoEntity)
    {
        task.status = status
        do {
            try context.save()
            DispatchQueue.main.async {
                self.getData()
            }
        } catch {
            displayAlertMessage(userMessage: "Some Error Occured!", myView: self)
        }
    }
    
    func getData()
    {
        self.filterdata.removeAll()
        
        do {
            
            self.models = try context.fetch(ToDoEntity.fetchRequest())
            self.filterdata = self.models
            
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
            
        } catch {
           //error
        }
    }
    
    func removeData(data: ToDoEntity)
    {
        context.delete(data)
        do
        {
            displayAlertMessage(userMessage: "Task removed Successfully.", myView: self)
            try context.save()
            DispatchQueue.main.async {
                self.getData()
            }
        }
        catch
        {
            displayAlertMessage(userMessage: "Some Error Occured.", myView: self)
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
        }
        catch
        {
            //error
        }
    }
    
}

