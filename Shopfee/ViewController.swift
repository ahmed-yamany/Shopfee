//
//  ViewController.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 26/04/2024.
//

import UIKit

class ViewController: UIViewController {
    let label = UILabel(frame: .init(x: 100, y: 100, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        view.addSubview(label)
        label.numberOfLines = 0
        label.text = "Choose".localized
    }
}
