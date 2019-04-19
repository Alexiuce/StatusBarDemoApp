//
//  XCCoordinator.swift
//  XCCoordinatorDemo
//
//  Created by Alexcai on 2019/4/18.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import Foundation
import UIKit

protocol XCCoordinator: AnyObject {
    var chileCoordinators : [XCCoordinator] {get set}
    var navigationController : UINavigationController {get set}
    func start()
}
