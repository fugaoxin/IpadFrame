//
//  QuickControl.m
//  QuickControl
//
//  Created by QF on 15-6-11.
//  Copyright (c) 2015年 QF. All rights reserved.
//


#import "QuickControl.h"

@implementation QuickControl

//快速创建一个系统button
+(UIButton *)initSystemButtonWithFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

//快速创建一个图片button
+(UIButton *)initCustomButtonWithFrame:(CGRect)frame title:(NSString*)title titleColor:(UIColor *)titleColor background:(UIImage *)background image:(UIImage *)image target:(id)target action:(SEL)action
{
    //创建一个图片button并根据传入属性设置按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    [button setBackgroundImage:background forState:UIControlStateNormal];
    
    [button setImage:image forState:UIControlStateNormal];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

//imageView快速创建
+(UIImageView *)initImageViewWithFrame:(CGRect)frame image:(UIImage *)image{
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = frame;
    imageView.image = image;
    
    return imageView;
}

//label的快速创建
+(UILabel *)initLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAliganment:(NSTextAlignment)textAliganment
{
    UILabel *label = [[UILabel alloc]init];
    
    label.frame = frame;
    
    label.text = text;
    
    //判断是不是UIColor类型，如果是，才去改变label的颜色
    if ([textColor isKindOfClass:[UIColor class]]) {
        label.textColor = textColor;
    }
    
    label.font = font;
    
    //是否存在textAliganment
    if (textAliganment) {
        label.textAlignment = textAliganment;
    }
    
    return label;
}

@end
