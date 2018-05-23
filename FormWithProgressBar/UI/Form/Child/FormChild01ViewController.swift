//
//  FormChild01ViewController.swift
//  FormWithProgressBar
//
//  Created by Masakazu Sano on 2018/05/23.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import SwiftHEXColors

final class FormChild01ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    var titleStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleStr
        prepareTableView()
    }
}

extension FormChild01ViewController {
    fileprivate func prepareTableView() {
        tableView.contentInset = UIEdgeInsets.init(
            top: tableView.contentInset.top,
            left: tableView.contentInset.left,
            // NOTE: magic number means fixed area height in parent VC.
            bottom: tableView.contentInset.bottom + 150,
            right: tableView.contentInset.right
        )
    }
}

extension FormChild01ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
        ) -> Int {
        return 50
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
        ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "cell \(indexPath.row + 1)"
        cell.textLabel?.textColor = UIColor(hexString: "#eeccff")
        return cell
    }
}

