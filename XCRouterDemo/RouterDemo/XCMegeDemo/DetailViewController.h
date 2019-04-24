//
//  DetailViewController.h
//  XCMegeDemo
//
//  Created by Alexcai on 2019/4/23.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

