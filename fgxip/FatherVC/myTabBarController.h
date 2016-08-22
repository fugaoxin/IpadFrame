//
//  myTabBarController.h
//  UITabBarController zidingyiDemo
//
//  Created by QF on 15-6-16.
//  Copyright (c) 2015年 QF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTabBarController : UIViewController

@property(nonatomic,strong)UIImageView *tabBarBgImageView;//设置tabBar的背景颜色

@property(nonatomic,strong)UIColor *titleColorNormal;

@property(nonatomic,strong)UIColor *titleColorSelected;

@property(nonatomic,assign)UIEdgeInsets barTitleEdge;

@property(nonatomic,assign)UIEdgeInsets barImageEdge;

-(void)setTabBarControllerWithVCArray:(NSArray *)vcArray andPhotoArray:(NSArray *)photoArray selectedPhotoArray:(NSArray *)selectedPhotoArray titleArray:(NSArray *)titleArray;

@property(nonatomic,strong)NSString * titleString;

@end

