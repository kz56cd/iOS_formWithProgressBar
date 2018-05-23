//
//  OnlyProgressBarViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import FlexibleSteppedProgressBar

final class OnlyProgressBarViewController: UIViewController {

    @IBOutlet weak var progressBar: FlexibleSteppedProgressBar!
    //    var progressBar: FlexibleSteppedProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareProgressBar()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension OnlyProgressBarViewController {
    fileprivate func prepareProgressBar() {
        progressBar.delegate = self
    }
}

extension OnlyProgressBarViewController: FlexibleSteppedProgressBarDelegate {
    func progressBar(_ progressBar: FlexibleSteppedProgressBar, didSelectItemAtIndex index: Int) {
        
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
