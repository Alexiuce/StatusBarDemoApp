//
//  XCBuyCoordinator.swift
//  XCCoordinatorDemo
//
//  Created by Alexcai on 2019/4/19.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import Foundation
import UIKit

class XCBuyCoordinator: XCCoordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var chileCoordinators = [XCCoordinator]()
    
    var navigationController: UINavigationController

    init(navigatroller:UINavigationController) {
        self.navigationController = navigatroller
    }
    
    func start() {
        let vc = XCBuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishedBuying()  {
        parentCoordinator?.childDidFinished(self)
    }
    
}
