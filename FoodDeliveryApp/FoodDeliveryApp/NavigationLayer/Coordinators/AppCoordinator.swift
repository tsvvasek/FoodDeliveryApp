//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Василий Цветков on 18.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    override func start() {
        showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
    
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDeligate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController, finishDeligate: self)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "house"), tag: 0)
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController, finishDeligate: self)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: .init(systemName: "house"), tag: 1)
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController, finishDeligate: self)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: .init(systemName: "house"), tag: 2)
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .home, navigationController: profileNavigationController, finishDeligate: self)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: .init(systemName: "house"), tag: 3)
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tubBarControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController
        ]
        
        let tabBarController = TabBarController(tabBarControllers: tubBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
        
    }
}

extension AppCoordinator: CoordinatorFinishDeligate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
 
}
