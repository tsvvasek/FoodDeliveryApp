//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Василий Цветков on 21.03.2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    private var pages: [UIViewController]
    
    // MARK: - Views
    private var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private var pageControl = UIPageControl()
    weak var viewOutput: OnboardingViewOutput!
    
    init(pages: [UIViewController] = [UIViewController](), viewOutput: OnboardingViewOutput) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupPageControl()
    }

}

// MARK: - Layout
private extension OnboardingViewController {
    func setupViewController() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    func setupPageControl(){
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

// MARK: UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
            return nil }
        return pages[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < pages.count - 1 else {
            return nil }
        return pages[currentIndex+1]
    }
}

// MARK: UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let viewController = pendingViewControllers.first, let index = pages.firstIndex(of: viewController) {
            pageControl.currentPage = index
        }
    }
}
