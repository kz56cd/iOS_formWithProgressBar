//
//  FormPageViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class FormPageViewController: UIPageViewController {
    
    let pageChildViewControllers: [UIViewController] = [
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChildViewControllers()
    }
}

extension FormPageViewController {
    fileprivate func configureChildViewControllers() {
        func addChildViewControllers() {
            self.setViewControllers(
                [pageChildViewControllers.first!],
                direction: UIPageViewControllerNavigationDirection.forward,
                animated: true) { result in
                    print("page set: \(result)")
            }
        }
        
        dataSource = self
        delegate = self
        addChildViewControllers()
        self.transitionStyle
    }
}

extension FormPageViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
        ) -> UIViewController? {
        guard let index = pageChildViewControllers.index(of: viewController as! FormChild01ViewController),
            index > 0 else {
                return nil
        }
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
        return pageChildViewControllers[index + 1]
    }
}

extension FormPageViewController: UIPageViewControllerDelegate {
    
}

