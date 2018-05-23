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
        let pageViewController = StoryboardScene.FormPageViewController.initialScene.instantiate()
        addChildViewController(pageViewController, to: containerView)
    }
}


