//
//  CustomSegmentView.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 10/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class CustomSegmentView: UIView {

    var indicatorWidth:CGFloat!
    let segmentWidth = (UIScreen.main.bounds.width - 50)
    
    let segmentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.lightBlue
        v.layer.cornerRadius = 12
        return v
    }()
    
    let stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.spacing = 0
        // v.backgroundColor = .cyan
        return v
    }()
    
    let indicatorView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.appBlue
        v.layer.cornerRadius = 8
        v.layer.shadowColor = CustomColor.appBlue.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.layer.shadowOpacity = 0.3
        v.layer.shadowRadius = 10
        return v
    }()
    
    let button1:UIButton = {
        let btn = UIButton()
        btn.setTitle("Ps4", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont(name: CustomFont.PoppinsMedium, size: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn1Pressed), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    let button2:UIButton = {
        let btn = UIButton()
        btn.setTitle("XOne", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont(name: CustomFont.PoppinsMedium, size: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn2Pressed), for: .touchUpInside)
        return btn
    }()
    
    let button3:UIButton = {
        let btn = UIButton()
        btn.setTitle("Switch", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont(name: CustomFont.PoppinsMedium, size: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn3Pressed), for: .touchUpInside)
        return btn
    }()
    
    let button4:UIButton = {
        let btn = UIButton()
        btn.setTitle("Pc", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont(name: CustomFont.PoppinsMedium, size: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn4Pressed), for: .touchUpInside)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(segmentView)
        segmentView.addSubview(indicatorView)
        segmentView.addSubview(stackView)
        stackView.pin(to: segmentView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        indicatorWidth = (segmentWidth / 4)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            segmentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            segmentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            segmentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            segmentView.heightAnchor.constraint(equalToConstant: 50),
            
            indicatorView.leadingAnchor.constraint(equalTo: segmentView.leadingAnchor, constant: 5),
            indicatorView.widthAnchor.constraint(equalToConstant:indicatorWidth - 10),
            indicatorView.heightAnchor.constraint(equalToConstant: 40),
            indicatorView.centerYAnchor.constraint(equalTo: segmentView.centerYAnchor)
        ])
    }
    
    @objc func btn1Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button1.center.x
            self.button1.setTitleColor(.white, for: .normal)
            self.button2.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button3.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button4.setTitleColor(CustomColor.appBlack, for: .normal)
        }, completion: nil)
    }
    
    @objc func btn2Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button2.center.x
            self.button1.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button2.setTitleColor(.white, for: .normal)
            self.button3.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button4.setTitleColor(CustomColor.appBlack, for: .normal)
        }, completion: nil)
    }
    
    @objc func btn3Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button3.center.x
            self.button1.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button2.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button3.setTitleColor(.white, for: .normal)
            self.button4.setTitleColor(CustomColor.appBlack, for: .normal)
        }, completion: nil)
    }
    
    @objc func btn4Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button4.center.x
            self.button1.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button2.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button3.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button4.setTitleColor(.white, for: .normal)
        }, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
