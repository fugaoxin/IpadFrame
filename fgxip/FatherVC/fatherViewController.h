//
//  fatherViewController.h
//  RenrenWan Demo
//
//  Created by QF on 15-6-11.
//  Copyright (c) 2015年 QF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fatherViewController : UIViewController

@property(nonatomic,strong) UIImageView *headerBgImageView;

@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) UIButton *leftButton;

@property(nonatomic,strong) UIButton *rightButton;

-(void)rightButtonClick:(UIButton *)button;
-(void)dismVC;

@end
