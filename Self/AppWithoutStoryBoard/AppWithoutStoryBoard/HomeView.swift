//
//  HomeView.swift
//  AppWithoutStoryBoard
//
//  Created by Nihal on 12/6/20.
//

import UIKit

class HomeView: UIView {
    
    weak var homeViewController: HomeScreenController? {
        didSet{
            setupHomeView()
        }
    }
    
    let button: UIButton = {
        var helloBtn = UIButton()
        helloBtn.translatesAutoresizingMaskIntoConstraints = false
        helloBtn.layer.cornerRadius = 16
        helloBtn.setTitle("Hello World", for: .normal)
        helloBtn.backgroundColor = .systemBlue
        helloBtn.setTitleColor(.white, for: .normal)
        helloBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        helloBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        return helloBtn
    }()
    
    let firstArtistLabel: UILabel = {
            let label = UILabel()
            label.text = "Porcupine Tree"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let firstArtistImageView1: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cover.jpg")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    let firstArtistImageView2: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cover.jpg")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    let firstArtistImageView3: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cover.jpg")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    let firstArtistImageView4: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "cover.jpg")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(firstArtistLabel)
        contentView.addSubview(button)
        contentView.addSubview(firstArtistImageView1)
        contentView.addSubview(firstArtistImageView2)
        contentView.addSubview(firstArtistImageView3)
        
        let imageWidth = firstArtistImageView1.image?.size.width
        let imageHeight = firstArtistImageView1.image?.size.height
        
        setupConstraints(imgWidth: imageWidth!, imgHeight: imageHeight!)
    }
    
    func setupConstraints(imgWidth: CGFloat, imgHeight: CGFloat){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            firstArtistLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            firstArtistLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            firstArtistLabel.heightAnchor.constraint(equalToConstant: 36),
            
            button.leftAnchor.constraint(equalTo: firstArtistLabel.rightAnchor, constant: 20),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 120),
            
            firstArtistImageView1.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            firstArtistImageView1.topAnchor.constraint(equalTo: firstArtistLabel.bottomAnchor),
            firstArtistImageView1.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            firstArtistImageView1.heightAnchor.constraint(equalTo: firstArtistImageView1.widthAnchor, multiplier: imgHeight / imgWidth),
            
            firstArtistImageView2.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            firstArtistImageView2.topAnchor.constraint(equalTo: firstArtistImageView1.bottomAnchor, constant: 120),
            firstArtistImageView2.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            firstArtistImageView2.heightAnchor.constraint(equalTo: firstArtistImageView1.widthAnchor, multiplier: imgHeight / imgWidth),
            
            firstArtistImageView3.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            firstArtistImageView3.topAnchor.constraint(equalTo: firstArtistImageView2.bottomAnchor, constant: 120),
            firstArtistImageView3.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            firstArtistImageView3.heightAnchor.constraint(equalTo: firstArtistImageView1.widthAnchor, multiplier: imgHeight / imgWidth),
            firstArtistImageView3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    func setupHomeView(){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let homeViewController = homeViewController {
            homeViewController.view.addSubview(self)
            setupHomeViewConstraints(homeController: homeViewController);
        }
    }
    
    func setupHomeViewConstraints(homeController: HomeScreenController){
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: homeController.view.leftAnchor),
            topAnchor.constraint(equalTo: homeController.view.topAnchor),
            rightAnchor.constraint(equalTo: homeController.view.rightAnchor),
            bottomAnchor.constraint(equalTo: homeController.view.bottomAnchor),
        ])
    }
    
    
    @objc func backBtnPressed() {
        homeViewController?.navigationController?.pushViewController(DetailScreenViewController(), animated: true)
    }
    
}
