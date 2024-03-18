//
//  Coordinator.swift
//  FoodDeliveryApp
//
//  Created by Василий Цветков on 18.03.2024.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var type: CoordinatorType { get }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController? { get set }
    var finishDeligate: CoordinatorFinishDeligate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
}

protocol CoordinatorFinishDeligate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController? { get set }
}

class Coordinator: CoordinatorProtocol {
    var type: CoordinatorType
    var childCoordinators: [CoordinatorProtocol]
    var navigationController: UINavigationController?
    var finishDeligate: CoordinatorFinishDeligate?

    init(type: CoordinatorType, childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), navigationController: UINavigationController, finishDeligate: CoordinatorFinishDeligate? = nil) {
        self.type = type
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
        self.finishDeligate = finishDeligate
    }
    
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach { $0.finishDeligate = nil }
        childCoordinators.removeAll()
    }
    
    func start() {
        print("Coordinator start")
    }
    
    func finish() {
        print("Coordinator finish")
    }
    
}

