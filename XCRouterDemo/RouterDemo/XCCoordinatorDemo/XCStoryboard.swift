//
//  XCStoryboard.swift
//  XCCoordinatorDemo
//
//  Created by Alexcai on 2019/4/18.
//  Copyright © 2019 dongjiu. All rights reserved.
//

import Foundation
import UIKit

protocol XCStoryboard {
    static func instantiate() -> Self
}


extension XCStoryboard where Self:UIViewController{
    static func instantiate() -> Self{
        let fullName = NSStringFromClass(self)
        let clsName = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: clsName) as! Self
    }
}
