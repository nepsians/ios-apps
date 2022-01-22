//
//  NextGameCardCollectionViewCell.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 11/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class NextGameCardCollectionViewCell: UICollectionViewCell {
    
    let cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        v.backgroundColor = .white
        return v
    }()
    
    let detailView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.appBlue
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return v
    }()
    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.image = UIImage(named: "gimg")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        return img
    }()
    
    let gameLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    let cartBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = CustomColor.appBlue
        btn.setImage(UIImage(named: "cart"), for: .normal)
        btn.layer.cornerRadius = 20
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        btn.layer.shadowRadius = 8
        btn.layer.shadowOpacity = 0.2
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        cardView.addSubview(cardImage)
        cardView.addSubview(detailView)
        detailView.addSubview(gameLabel)
        detailView.addSubview(cartBtn)
        cardImage.pin(to: cardView)
        setUpConstraints()
        setCardShadow()
        setUpAttributeText(title: "Crash Team Racing", subtitle: "Nitro-Fueled")
    }
    
    
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            cardView.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            
            detailView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            detailView.heightAnchor.constraint(equalToConstant: 70),
            
            gameLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 15),
            gameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 15),
            
            cartBtn.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -20),
            cartBtn.widthAnchor.constraint(equalToConstant: 50),
            cartBtn.heightAnchor.constraint(equalToConstant: 50),
            cartBtn.topAnchor.constraint(equalTo: detailView.topAnchor, constant: -25)
        ])
    }
    
    func setCardShadow(){
        cardView.layer.shadowColor = CustomColor.appBlue.cgColor
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = CGSize(width: 0, height: 8)
        cardView.layer.shadowOpacity = 0.4
    }
    
    func removeCardShadow(){
        cardView.layer.shadowRadius = 0
        cardView.layer.shadowOpacity = 0
    }
    
    func setUpAttributeText(title:String , subtitle:String){
        let attributedText = NSMutableAttributedString(string:"\(title)\n" , attributes:[NSAttributedString.Key.font: UIFont(name: CustomFont.RalewayBold, size: 18)!,NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "\(subtitle)" , attributes:[NSAttributedString.Key.font: UIFont(name:CustomFont.RalewayMediumItalic, size: 16)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        gameLabel.attributedText = attributedText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
