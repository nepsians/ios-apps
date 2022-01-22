//
//  ListTableViewCell.swift
//  ToDoProject
//
//  Created by BentRay on 03/04/2021.
//

import UIKit

protocol  ListTableViewDelegates:class {
    func actionStatus(_ sender: ListTableViewCell)
    func actionCheckBox(_ sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxButton: UIButton!
    weak var delegate: ListTableViewDelegates?
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var dateLabel: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func actionStatus(_ sender: Any) {
        
        self.delegate?.actionStatus(self)
    }
    
    @IBAction func actionCheckBox(_ sender: Any) {
        
        self.delegate?.actionCheckBox(self)
    }
}
