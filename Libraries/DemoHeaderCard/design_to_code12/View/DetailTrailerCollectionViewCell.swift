//
//  DetailTrailerCollectionViewCell.swift
//  design_to_code12
//
//  Created by Dheeraj Kumar Sharma on 11/08/20.
//  Copyright © 2020 Dheeraj Kumar Sharma. All rights reserved.
//

import UIKit

class DetailTrailerCollectionViewCell: UICollectionViewCell {
    
    var pulseArray = [CAShapeLayer]()
    let headingLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Trailer"
        l.font = UIFont(name: CustomFont.RalewayBold, size: 18)
        l.textColor = .black
        return l
    }()
    
    let posterImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "posterImg")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    let playBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setImage(UIImage(named: "play"), for: .normal)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 0)
        btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.1
        btn.layer.cornerRadius = 45
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headingLabel)
        addSubview(posterImage)
        addSubview(playBtn)
        setUpConstraints()
        createPulse()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant:20),
            
            posterImage.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 20),
            posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            posterImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            posterImage.heightAnchor.constraint(equalToConstant: 200),
            
            playBtn.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            playBtn.widthAnchor.constraint(equalToConstant: 90),
            playBtn.heightAnchor.constraint(equalToConstant: 90),
            playBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func createPulse() {
        for _ in 0...2 {
          let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
          let pulseLayer = CAShapeLayer()
          pulseLayer.path = circularPath.cgPath
          pulseLayer.lineWidth = 3.0
          pulseLayer.fillColor = UIColor.clear.cgColor
          pulseLayer.lineCap = CAShapeLayerLineCap.round
          pulseLayer.position = CGPoint(x: 45, y: 45)
          playBtn.layer.addSublayer(pulseLayer)
          pulseArray.append(pulseLayer)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.animatePulsatingLayerAt(index: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                self.animatePulsatingLayerAt(index: 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.animatePulsatingLayerAt(index: 2)
                })
            })
        })
    }
    
    func animatePulsatingLayerAt(index:Int) {
        
        pulseArray[index].strokeColor = UIColor.white.cgColor
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 0.9
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.fromValue = 0.9
        opacityAnimation.toValue = 0.0
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [scaleAnimation, opacityAnimation]
        groupAnimation.duration = 2.0
        groupAnimation.repeatCount = .greatestFiniteMagnitude
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        pulseArray[index].add(groupAnimation, forKey: "groupanimation")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
