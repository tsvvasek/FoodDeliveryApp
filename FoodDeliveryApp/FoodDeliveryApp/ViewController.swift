//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Василий Цветков on 16.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "hello World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)])
        
        label.font = .systemFont(ofSize: 40, weight: UIFont.Weight(20))
        label.textColor = .white
        
        view.backgroundColor = .red
    }


}

