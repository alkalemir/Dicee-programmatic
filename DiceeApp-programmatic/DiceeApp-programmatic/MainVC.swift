//
//  MainVC.swift
//  DiceeApp-programmatic
//
//  Created by Emir Alkal on 10.05.2022.
//

import UIKit

class MainVC: UIViewController {
    let backgroundImage    = UIImageView()
    let topImage           = UIImageView()
    let leftImage          = UIImageView()
    let rightImage         = UIImageView()
    let rollButton         = UIButton()
    
    let diceArr = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureButton()
        configureLayouts()
    }
    
    func configureUI() {
        view.addSubview(backgroundImage)
        view.addSubview(topImage)
        view.addSubview(leftImage)
        view.addSubview(rightImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        topImage.translatesAutoresizingMaskIntoConstraints = false
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        setRandomImages()
        backgroundImage.image = UIImage(named: "GreenBackground")
        topImage.image = UIImage(named: "DiceeLogo")
        
    }
    
    func configureButton() {
        view.addSubview(rollButton)
        
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        rollButton.backgroundColor = .systemRed
        rollButton.setTitle("Roll", for: .normal)
        rollButton.titleLabel?.textColor = .white
        rollButton.titleLabel?.font = .systemFont(ofSize: 26, weight: .bold)
        
        rollButton.addTarget(self, action: #selector(rolButtonClicked), for: .touchUpInside)
    }
    
    func configureLayouts() {
        
        let screenBounds = UIScreen.main.bounds

        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: screenBounds.height / 10),
            topImage.widthAnchor.constraint(equalToConstant: (screenBounds.width / 3) * 1.5),
            topImage.heightAnchor.constraint(equalToConstant: screenBounds.width / 3),
            topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            leftImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: screenBounds.width / 7),
            leftImage.widthAnchor.constraint(equalToConstant: screenBounds.height / 7),
            leftImage.heightAnchor.constraint(equalToConstant: screenBounds.height / 7)
        ])
        
        NSLayoutConstraint.activate([
            rightImage.centerYAnchor.constraint(equalTo: leftImage.centerYAnchor),
            rightImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: screenBounds.width / -7),
            rightImage.widthAnchor.constraint(equalToConstant: screenBounds.height / 7),
            rightImage.heightAnchor.constraint(equalToConstant: screenBounds.height / 7)
        ])
        

        NSLayoutConstraint.activate([
            rollButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: screenBounds.height / -10),
            rollButton.heightAnchor.constraint(equalToConstant: screenBounds.height / 10),
            rollButton.widthAnchor.constraint(equalToConstant: screenBounds.width / 2),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func rolButtonClicked() {
        setRandomImages()
    }
    
    func setRandomImages() {
        leftImage.image = diceArr.randomElement()
        rightImage.image = diceArr.randomElement()
    }
}
