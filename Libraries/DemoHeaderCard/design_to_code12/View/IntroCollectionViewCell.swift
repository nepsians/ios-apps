//
//  IntroCollectionViewCell.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 12/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class IntroCollectionViewCell: UICollectionViewCell {
    
    let introLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Intro"
        l.font = UIFont(name: CustomFont.RalewayBold, size: 18)
        l.textColor = .black
        return l
    }()
    
    let gameplayLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Gameplay"
        l.textColor = .lightGray
        l.font = UIFont(name: CustomFont.RalewayBold, size: 18)
        return l
    }()
    
    let bannerView:bannerGradient = {
        let v = bannerGradient()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        return v
    }()
    
    let textLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    let descLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Crash Team Racing is the fourth installment in the Crash Bandicoot series. The game's story focuses on the efforts of a ragtag team of characters in the Crash Bandicoot series.\n\n who must race against the egomaniacal Nitros Oxide to save their planet from destruction. In the game, players can take control of one of fifteen Crash Bandicoot series characters, though only eight are available at first. During the races, offensive and speed boosting power ups can be used to gain an advantage."
        l.font = UIFont(name: CustomFont.PoppinsMedium, size: 14)
        l.numberOfLines = 0
        l.textColor = .lightGray
        return l
    }()
    
    let stackView:UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        return sv
    }()
    
    let image1:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "gpimg1")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 10
        return img
    }()
    
    let image2:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "gpimg2")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 10
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(introLabel)
        addSubview(gameplayLabel)
        addSubview(bannerView)
        bannerView.addSubview(textLabel)
        addSubview(descLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(image1)
        stackView.addArrangedSubview(image2)
        setUpConstraints()
        setUpAttributeText(title: "Crash Team Racing", subtitle: "Nito-Fueled")
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            introLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            introLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            introLabel.heightAnchor.constraint(equalToConstant: 20),
            
            gameplayLabel.leadingAnchor.constraint(equalTo: introLabel.trailingAnchor, constant: 20),
            gameplayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            gameplayLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bannerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            bannerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            bannerView.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 20),
            bannerView.heightAnchor.constraint(equalToConstant: 100),
            
            textLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 25),
            textLabel.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor),
            
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            descLabel.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            
            stackView.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            stackView.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func setUpAttributeText(title:String , subtitle:String){
        let attributedText = NSMutableAttributedString(string:"\(title)\n" , attributes:[NSAttributedString.Key.font: UIFont(name: CustomFont.RalewayBold, size: 25)!,NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "\(subtitle)" , attributes:[NSAttributedString.Key.font: UIFont(name:CustomFont.RalewayMediumItalic, size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        textLabel.attributedText = attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
