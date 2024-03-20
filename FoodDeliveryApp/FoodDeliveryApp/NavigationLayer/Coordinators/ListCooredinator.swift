//
//  ListCooredinator.swift
//  FoodDeliveryApp
//
//  Created by Василий Цветков on 20.03.2024.
//

import UIKit

class ListCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}
