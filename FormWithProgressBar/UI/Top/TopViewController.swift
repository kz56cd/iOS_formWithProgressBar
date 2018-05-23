//
//  TopViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    
    @IBAction func onlyProgressBarButtonTapped(_ sender: UIButton) {
        presentOnlyProgressBarVC()
    }
    @IBAction func formButtonTapped(_ sender: UIButton) {
        presentFormVC()
    }
}

extension TopViewController {
    fileprivate func presentOnlyProgressBarVC() {
        let vc = StoryboardScene.OnlyProgressBarViewController.initialScene.instantiate()
        present(vc, animated: true, completion: nil)
    }
    
    fileprivate func presentFormVC() {
        let vc = StoryboardScene.FormViewController.initialScene.instantiate()
        present(vc, animated: true, completion: nil)
    }
}
