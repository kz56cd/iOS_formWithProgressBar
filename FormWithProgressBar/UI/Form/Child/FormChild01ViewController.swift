//
//  FormChild01ViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit

final class FormChild01ViewController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    var titleStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleStr
    }
}
