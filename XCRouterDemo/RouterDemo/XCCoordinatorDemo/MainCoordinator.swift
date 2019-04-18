//
//  MainCoordinator.swift
//  XCCoordinatorDemo
//
//  Created by Alexcai on 2019/4/18.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: XCCoordinator {
    var chileCoordinators = [XCCoordinator]()
    
    var navigationController: UINavigationController
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func buySubscription()  {
        let vc = XCBuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func creatAccount()  {
        let vc = XCCreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
