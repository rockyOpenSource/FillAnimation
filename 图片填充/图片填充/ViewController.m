//
//  ViewController.m
//  图片填充
//
//  Created by qishang on 16/2/23.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "ViewController.h"
#import "MaskAnimation.h"
@interface ViewController () {

    MaskAnimation *animation ;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    animation = [[MaskAnimation alloc] initWithFrame:CGRectMake(0, 0, 104, 157)];
    [self.view addSubview:animation];

}

//开始
- (IBAction)startFillAnimation:(id)sender {
    
    [animation startFillAnimation];
}

//暂停
- (IBAction)pasueFillAnimation:(id)sender {
    
    [animation pasueFillAnimation];
}

//恢复
- (IBAction)resumeFillAnimation:(id)sender {
    
    [animation resumeFillAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
