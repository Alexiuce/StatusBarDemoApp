//
//  XCBeginTimeViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/15.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCBeginTimeViewController.h"

@interface XCBeginTimeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

@end

@implementation XCBeginTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/** Core Animation Time 相对时间 : begin time , time off , speed , */
/** begin time : 动画开始时间,用作延时, 默认是0,也就是动画添加到可视layer后,立刻开始动画效果
 time offset: 动画偏移时间,相当于快进效果,也就是动画从duration的哪个时间开始执行;
 */
- (IBAction)timeOffsetSliderChanged:(UISlider *)sender {
    self.timeOffsetLabel.text = @(sender.value).stringValue;
}
- (IBAction)speedSliderChanged:(UISlider *)sender {
    self.speedLabel.text = @(sender.value).stringValue;
}

- (IBAction)playButtonClicked:(UIButton *)sender {
}

@end
