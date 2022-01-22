//
//  ViewController.swift
//  MVVMExample
//
//  Created by Nihal on 12/3/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private var models: [Person] = []
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(PersonFollowingTableViewCell.self, forCellReuseIdentifier: PersonFollowingTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels();
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configureModels(){
        let names = ["Ram", "Hari", "Shyam", "Nihal", "John"]
        
        for name in names {
            models.append(Person(name: name, lastName: "shrestha", address: "Thashikhel", userName: "Nepsian", gender: .male, isFollowing: false))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonFollowingTableViewCell.identifier, for: indexPath) as? PersonFollowingTableViewCell else {
                return UITableViewCell()
            }
        print("inside")
        cell.configure(with: PersonFollowingTabelViewCellViewModal(with: model))
        cell.delegate = self
        return cell
    }


}

extension ViewController: PersonFollowingTableViewCellDelegate{
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTabelViewCellViewModal) {
        

        
//        let filtered=models.map{
//            if($0.name == viewModel.name){
//                $0.name = "adfionaidsfnoiansdfoinadsoifnaosdnf"
//            }
//        }
        
       
//        for model in models {
//            if(model.name == viewModel.name){
//                model.isFollowing = viewModel.currentlyFollowing
//            }
//        }
    
        models.filter({$0.name==viewModel.name}).first?.isFollowing = viewModel.currentlyFollowing
        
        tableView.reloadData()
    }
}

