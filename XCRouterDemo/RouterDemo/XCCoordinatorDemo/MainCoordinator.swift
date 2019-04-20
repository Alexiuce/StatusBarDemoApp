//
//  MainCoordinator.swift
//  XCCoordinatorDemo
//
//  Created by Alexcai on 2019/4/18.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject , XCCoordinator {
    var chileCoordinators = [XCCoordinator]()
    
    var navigationController: UINavigationController
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.delegate = self
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

extension MainCoordinator : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        /** 获取正在处理的Controller */
        guard let fromVc = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return  }
        /** 通过检查导航栈 判断导航操作类型: 如果不是pop 操作 返回*/
        if navigationController.viewControllers.contains(fromVc){
            return
        }
        /** 确认完成 */
        if let buyVc = fromVc as? XCBuyViewController {
            childDidFinished(buyVc.coordinator)
        }
    }
}
