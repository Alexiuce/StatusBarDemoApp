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
    
    
    func childDidFinished(_ child : XCCoordinator?)  {
        for (index,coordinator) in chileCoordinators.enumerated(){
            if coordinator === child {
                chileCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
    func buySubscription()  {
//        let vc = XCBuyViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
        
        let child = XCBuyCoordinator(navigatroller: navigationController)
        child.parentCoordinator = self
        chileCoordinators.append(child)
        child.start()
    }
    
    func creatAccount()  {
        let vc = XCCreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
