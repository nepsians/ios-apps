//
//  PersonFollowingTableViewCell.swift
//  MVVMExample
//
//  Created by Nihal on 12/3/20.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func personFollowingTableViewCell(
        _ cell: PersonFollowingTableViewCell,
        didTapWith viewModel: PersonFollowingTabelViewCellViewModal
    )
}

class PersonFollowingTableViewCell: UITableViewCell {
    static let identifier = "PersonFollowingTableViewCell"
    
    weak var delegate: PersonFollowingTableViewCellDelegate?
    
    private var viewModal: PersonFollowingTabelViewCellViewModal?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton(){
        guard let copyViewModel = viewModal else {
            return
        }
        
        var newViewModel = copyViewModel;
        newViewModel.currentlyFollowing = !copyViewModel .currentlyFollowing
    
        delegate?.personFollowingTableViewCell(self, didTapWith: newViewModel)
        
//         prepareForReuse();
//        configure(with: newViewModel)
    }
    
    
    func configure(with viewModel: PersonFollowingTabelViewCellViewModal){
        self.viewModal = viewModel
        nameLabel.text = viewModel.name
        userNameLabel.text = viewModel.userName
        userImageView.image = viewModel.image
        
        if(viewModel.currentlyFollowing){
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }else{
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        let imageWidth = contentView.frame.size.height - 10
        userImageView.frame = CGRect(x: 5, y: 5,
                                     width: imageWidth,
                                     height: imageWidth)
        
        nameLabel.frame = CGRect(x: imageWidth+10,
                                     y: 0,
                                     width: contentView.frame.size.width-imageWidth,
                                     height: contentView.frame.size
                                        .height/2)
        
        userNameLabel.frame = CGRect(x: imageWidth+10,
                                     y: contentView.frame.size.height/2,
                                     width: contentView.frame.size.width-imageWidth,
                                     height: contentView.frame.size
                                        .height/2)

        button.frame = CGRect(x: contentView.frame.size
                                .width-120,
                              y: 10, width: 110,
                              height: contentView.frame.size.height-20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        userNameLabel.text = nil
        userImageView.image = nil
        button.setTitle(nil, for: .normal)
        button.layer.borderWidth = 0
        button.backgroundColor = nil
    }
}
 
