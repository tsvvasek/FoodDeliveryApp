//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Василий Цветков on 21.03.2024.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
    
}
