//
//  FormViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import Prelude

enum PagingDirection {
    case back
    case next
}

final class FormViewController: UIViewController, ContainerViewShowing {

    @IBOutlet weak var containerView: UIView!
    
    let pageChildViewControllers: [UIViewController] = [
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate()
    ]
    let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal,
        options: nil
    )
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
    }
    
    // MARK: - action
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        paging(by: .reverse)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        paging(by: .forward)
    }
}

extension FormViewController {
    fileprivate func configureContainerView() {
        func preparePageViewController() {
            pageViewController.delegate = self
            pageViewController.dataSource = self
            pageViewController.setViewControllers(
                [pageChildViewControllers.first!],
                direction: .forward,
                animated: true) { result in
                    print("page set: \(result)")
            }
        }
        
        preparePageViewController()
        addChildViewController(pageViewController, to: containerView)
    }
    
    fileprivate func paging(by direction: UIPageViewControllerNavigationDirection) {
        switch direction {
        case .reverse:
            guard selectedIndex - 1 >= 0 else { return }
            selectedIndex -= 1
        case .forward:
            guard pageChildViewControllers.count > selectedIndex + 1 else { return }
            selectedIndex += 1
        }
        pageViewController.setViewControllers(
            [pageChildViewControllers[selectedIndex]],
            direction: direction,
            animated: true,
            completion: nil
        )
    }
}

extension FormViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
        guard let index = pageChildViewControllers.index(of: viewController as! FormChild01ViewController),
            index > 0 else {
                return nil
        }
        selectedIndex = index
        return pageChildViewControllers[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
        ) -> UIViewController? {
        guard let index = pageChildViewControllers.index(of: viewController as! FormChild01ViewController),
            index < pageChildViewControllers.count - 1 else {
                return nil
        }
        selectedIndex = index
        return pageChildViewControllers[index + 1]
    }
}

extension FormViewController: UIPageViewControllerDelegate {
    
}
