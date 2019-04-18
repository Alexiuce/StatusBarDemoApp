//
//  ViewController.swift
//  XCCoordinatorDemo
//
//  Created by Alexcai on 2019/4/18.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XCStoryboard {
    weak var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccount(_ sender: Any) {
        coordinator?.creatAccount()
    }
    
}

