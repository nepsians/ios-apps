//
//  GameOverviewTableViewCell.swift
//  design_to_code18
//
//  Created by Dheeraj Kumar Sharma on 08/09/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class GameOverviewTableViewCell: UITableViewCell {

    let gameImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 25
        img.image = UIImage(named: "logo")
        img.layer.masksToBounds = true
        return img
    }()
    
    let gameTitle:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string:"Call of Duty: Mobile" , attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
        attributedText.append(NSAttributedString(string: "\nBattle Royale, Sniper, 5v5" , attributes:
        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15 , weight:.regular), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        l.attributedText = attributedText
        return l
    }()
    
    let getButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 17.5
        btn.backgroundColor = UIColor.systemBlue
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return btn
    }()
    
    let moreBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(gameImageView)
        addSubview(gameTitle)
        addSubview(getButton)
        addSubview(moreBtn)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            gameImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gameImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            gameImageView.widthAnchor.constraint(equalToConstant: 120),
            gameImageView.heightAnchor.constraint(equalToConstant: 120),
            
            gameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            gameTitle.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 20),
            gameTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            getButton.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 20),
            getButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 35),
            
            moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            moreBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            moreBtn.widthAnchor.constraint(equalToConstant: 35),
            moreBtn.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
