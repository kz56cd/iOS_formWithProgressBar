//
//  FormViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import Prelude

final class FormViewController: UIViewController, ContainerViewShowing {

    let pageChildViewControllers: [UIViewController] = [
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate(),
        StoryboardScene.FormChild01ViewController.initialScene.instantiate()
    ]
    
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension FormViewController {
    fileprivate func configureContainerView() {
        func initPageViewController() -> UIPageViewController {
            let pageViewController = UIPageViewController(
                transitionStyle: .scroll,
                navigationOrientation: .horizontal,
                options: nil
            )
            pageViewController.delegate = self
            pageViewController.dataSource = self
            pageViewController.setViewControllers(
                [pageChildViewControllers.first!],
                direction: UIPageViewControllerNavigationDirection.forward,
                animated: true) { result in
                    print("page set: \(result)")
            }
            return pageViewController
        }
        
        addChildViewController(initPageViewController(), to: containerView)
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

extension FormViewController: UIPageViewControllerDelegate {
    
}


