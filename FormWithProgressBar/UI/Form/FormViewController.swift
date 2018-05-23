//
//  FormViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import Prelude
import FlexibleSteppedProgressBar
import SwiftHEXColors

final class FormViewController: UIViewController, ContainerViewShowing {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressBar: FlexibleSteppedProgressBar!
    
    let blueColor = UIColor(hexString: "#2387d1")!
    let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal,
        options: nil
    )
    
    var pageChildViewControllers: [FormChild01ViewController] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
        prepareProgressBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        _ = pageChildViewControllers.enumerated().map { (offset, vc) -> FormChild01ViewController in
////            vc.label.text = "\(offset + 1)"
////            vc.label.text = "hoge"
////            print("\(vc)")
//            return vc
//        }
    }
    
    // MARK: - action
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        updateIndex(by: .reverse)
        paging(by: .reverse)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        updateIndex(by: .forward)
        paging(by: .forward)
    }
}

extension FormViewController {
    // MARK: - ContainerView, PageViewController
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
        
        for index in 0...6 {
            let vc = StoryboardScene.FormChild01ViewController.initialScene.instantiate()
            vc.titleStr = "\(index)"
            pageChildViewControllers.append(vc)
        }
        preparePageViewController()
        addChildViewController(pageViewController, to: containerView)
    }
    
    // MARK: - FlexibleSteppedProgressBar
    fileprivate func prepareProgressBar() {
        progressBar.delegate = self
        progressBar.numberOfPoints = pageChildViewControllers.count
        
        // custumize UI / animation
        progressBar.currentSelectedCenterColor = blueColor
        progressBar.selectedOuterCircleStrokeColor = blueColor
        progressBar.selectedBackgoundColor = blueColor
        
        progressBar.selectedOuterCircleLineWidth = 0
        progressBar.stepAnimationDuration = 0.2
    }
    
    // MARK: - Paging control
    fileprivate func updateIndex(by direction: UIPageViewControllerNavigationDirection) {
        switch direction {
        case .reverse:
            guard selectedIndex - 1 >= 0 else { return }
            selectedIndex -= 1
        case .forward:
            guard pageChildViewControllers.count > selectedIndex + 1 else { return }
            selectedIndex += 1
        }
    }
    
    fileprivate func paging(by direction: UIPageViewControllerNavigationDirection) {
        pageViewController.setViewControllers(
            [pageChildViewControllers[selectedIndex]],
            direction: direction,
            animated: true,
            completion: nil
        )
        progressBar.currentIndex = selectedIndex
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

extension FormViewController: UIPageViewControllerDelegate { /* stub */ }
//extension FormViewController: FlexibleSteppedProgressBarDelegate { /* stub */ }


extension FormViewController: FlexibleSteppedProgressBarDelegate {
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, didSelectItemAtIndex index: Int) {
        let direction: UIPageViewControllerNavigationDirection = selectedIndex < index ? .forward : .reverse
        selectedIndex = index
        paging(by: direction)
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, willSelectItemAtIndex index: Int) {
        
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, canSelectItemAtIndex index: Int) -> Bool {
        return true
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        //        if position == FlexibleSteppedProgressBarTextLocation.bottom {
        //            switch index {
        //                case 0: return "First"
        //                case 1: return "Second"
        //                case 2: return "Third"
        //                case 3: return "Fourth"
        //                case 4: return "Fifth"
        //                default: return "Date"
        //            }
        //        }
        return ""
    }
}
