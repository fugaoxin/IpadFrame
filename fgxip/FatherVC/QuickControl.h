//
//  QuickControl.h
//  QuickControl
//
//  Created by QF on 15-6-11.
//  Copyright (c) 2015年 QF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface QuickControl : NSObject
//声明类方法

//快速创建一个系统按钮
+(UIButton *)initSystemButtonWithFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action;

//快速创建一个图片按钮
+(UIButton *)initCustomButtonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor *)titleColor background:(UIImage *)background image:(UIImage *)image target:(id)target action:(SEL)action;

//快速创建一个图片
+(UIImageView *)initImageViewWithFrame:(CGRect)frame image:(UIImage *)image;

//快速创建一个文本
+(UILabel *)initLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAliganment:(NSTextAlignment)textAliganment;
@end
