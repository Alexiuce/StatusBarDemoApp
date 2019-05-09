//
//  ViewController.swift
//  AdaptiveRaywenderlich
//
//  Created by Alexcai on 2019/5/8.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.init(named: "L1")
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        present(XCAdaptiveViewController(), animated: true, completion: nil)
    }

}

