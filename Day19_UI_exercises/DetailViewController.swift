//
//  DetailViewController.swift
//  Day19_UI_exercises
//
//  Created by Hoang Tung on 12/17/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "foodImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kung Pao Potato"
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lunch Box"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50%"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    let greenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGreen
        button.setTitle("ADD", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(cancelPress))
//        navigationController?.navigationBar.barTintColor = .white
        cancelButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = cancelButton
        
        view.addSubview(foodImage)
        view.addSubview(nameLabel)
        view.addSubview(detailLabel)
        view.addSubview(discountLabel)
        view.addSubview(greenButton)
        setupLayout()
    }
    
    @objc func cancelPress(){
        dismiss(animated: true, completion: nil)
    }
    
    func setupLayout() {
        foodImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        foodImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        foodImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        foodImage.heightAnchor.constraint(equalToConstant: 233).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 32).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        detailLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        discountLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 200).isActive = true
        discountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        discountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        discountLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        greenButton.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 64).isActive = true
        greenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        greenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        greenButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
