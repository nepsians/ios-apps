//
//  TopGamesCollectionViewCell.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 11/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class TopGamesCollectionViewCell: UICollectionViewCell {
    
    let headingLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Top games"
        l.font = UIFont(name: CustomFont.RalewayBold, size: 20)
        l.textColor = CustomColor.appBlack
        return l
    }()
    
    let optionBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "option"), for: .normal)
        return btn
    }()
    
    let cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let horizontalStackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.spacing = 20
        return v
    }()
    
    let verticalStackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 20
        return v
    }()
    
    let HView1:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let HView2:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.yellow.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 12
        v.layer.shadowOpacity = 0.3
        return v
    }()
    
    let VView1:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor(red: 172/255, green: 135/355, blue: 87/255, alpha: 1).cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 12
        v.layer.shadowOpacity = 0.5
        return v
    }()
    
    let VView2:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.lightGray.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 12
        v.layer.shadowOpacity = 0.8
        return v
    }()
    
    //MARK:- StackImages
    
    let image1:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img1")
        return img
    }()
    
    let image2:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img2")
        return img
    }()
    
    let image3:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img3")
        return img
    }()
    
    //MARK:- StackLabels
    
    let label1:UILabel = {
        let l = UILabel()
        l.text = "Rage 2"
        l.textColor = .white
        l.numberOfLines = 0
        l.font = UIFont(name: CustomFont.RalewaySemiBoldItalic, size: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let label2:UILabel = {
        let l = UILabel()
        l.text = "Cyberpunk 2077"
        l.textColor = .white
        l.numberOfLines = 0
        l.font = UIFont(name: CustomFont.RalewaySemiBoldItalic, size: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let label3:UILabel = {
        let l = UILabel()
        l.text = "Fortnite"
        l.numberOfLines = 0
        l.textColor = .white
        l.font = UIFont(name: CustomFont.RalewaySemiBoldItalic, size: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
//    MARK:- StackOverlay
    
    let overlayView1:GradientView = {
        let v = GradientView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        return v
    }()
    
    let overlayView2:GradientView = {
        let v = GradientView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        return v
    }()
    
    let overlayView3:GradientView = {
        let v = GradientView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headingLabel)
        addSubview(optionBtn)
        addSubview(cardView)
        cardView.addSubview(horizontalStackView)
        horizontalStackView.pin(to: cardView)
        horizontalStackView.addArrangedSubview(HView1)
        horizontalStackView.addArrangedSubview(HView2)
        HView1.addSubview(verticalStackView)
        verticalStackView.pin(to: HView1)
        verticalStackView.addArrangedSubview(VView1)
        verticalStackView.addArrangedSubview(VView2)
        
        VView1.addSubview(image1)
        VView2.addSubview(image2)
        HView2.addSubview(image3)
        
        VView1.addSubview(overlayView1)
        VView2.addSubview(overlayView2)
        HView2.addSubview(overlayView3)
        
        overlayView1.addSubview(label1)
        overlayView2.addSubview(label2)
        overlayView3.addSubview(label3)

        image1.pin(to: VView1)
        image2.pin(to: VView2)
        image3.pin(to: HView2)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            headingLabel.heightAnchor.constraint(equalToConstant: 25),
            
            optionBtn.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            optionBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            optionBtn.widthAnchor.constraint(equalToConstant: 25),
            optionBtn.heightAnchor.constraint(equalToConstant: 25),
            
            cardView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 20),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            overlayView1.bottomAnchor.constraint(equalTo: VView1.bottomAnchor),
            overlayView1.leadingAnchor.constraint(equalTo: VView1.leadingAnchor),
            overlayView1.trailingAnchor.constraint(equalTo: VView1.trailingAnchor),
            overlayView1.heightAnchor.constraint(equalToConstant: 65),
            
            overlayView2.bottomAnchor.constraint(equalTo: VView2.bottomAnchor),
            overlayView2.leadingAnchor.constraint(equalTo: VView2.leadingAnchor),
            overlayView2.trailingAnchor.constraint(equalTo: VView2.trailingAnchor),
            overlayView2.heightAnchor.constraint(equalToConstant: 85),
            
            overlayView3.bottomAnchor.constraint(equalTo: HView2.bottomAnchor),
            overlayView3.leadingAnchor.constraint(equalTo: HView2.leadingAnchor),
            overlayView3.trailingAnchor.constraint(equalTo: HView2.trailingAnchor),
            overlayView3.heightAnchor.constraint(equalToConstant: 85),
            
            label1.leadingAnchor.constraint(equalTo: overlayView1.leadingAnchor,constant: 15),
            label1.trailingAnchor.constraint(equalTo: overlayView1.trailingAnchor,constant: -20),
            label1.bottomAnchor.constraint(equalTo: overlayView1.bottomAnchor, constant: -15),
            
            label2.leadingAnchor.constraint(equalTo: overlayView2.leadingAnchor,constant: 15),
            label2.trailingAnchor.constraint(equalTo: overlayView2.trailingAnchor,constant: -20),
            label2.bottomAnchor.constraint(equalTo: overlayView2.bottomAnchor, constant: -15),
            
            label3.leadingAnchor.constraint(equalTo: overlayView3.leadingAnchor,constant: 15),
            label3.trailingAnchor.constraint(equalTo: overlayView3.trailingAnchor,constant: -20),
            label3.bottomAnchor.constraint(equalTo: overlayView3.bottomAnchor, constant: -15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
