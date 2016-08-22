//
//  fatherViewController.m
//  RenrenWan Demo
//
//  Created by QF on 15-6-11.
//  Copyright (c) 2015年 QF. All rights reserved.
//

#import "fatherViewController.h"
#import "QuickControl.h"
#import "informationVC.h"

@interface fatherViewController ()

@end

@implementation fatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self setTitleBar];
    // Do any additional setup after loading the view.
}

-(void)setTitleBar{
    
    self.headerBgImageView = [QuickControl initImageViewWithFrame:CGRectMake(0, 0, screenWidth, 64) image:[UIImage imageNamed:@"fgx.png"]];
    self.headerBgImageView.userInteractionEnabled = YES;
    
    self.headerBgImageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.headerBgImageView];
    
    UILabel * lane1=[[UILabel alloc] initWithFrame:CGRectMake(0, 63, screenWidth, 1)];
    lane1.backgroundColor=[UIColor grayColor];
    lane1.alpha=0.5;
    [self.headerBgImageView addSubview:lane1];
    
    //设置title
    self.titleLabel = [QuickControl initLabelWithFrame:CGRectMake(0, 20, screenWidth-128, 44) text:@"" textColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:20] textAliganment:NSTextAlignmentCenter];
    self.titleLabel.textColor=[UIColor purpleColor];
    self.titleLabel.userInteractionEnabled=YES;
    
    [self.headerBgImageView addSubview:self.titleLabel];

    //创建左按钮
    self.leftButton = [QuickControl initCustomButtonWithFrame:CGRectMake(10, 25, 34, 44 - 5*2) title:nil titleColor:[UIColor whiteColor] background:[UIImage imageNamed:@"photo_left_nav.png"] image:nil target:self action:@selector(dismVC)];
    self.leftButton.backgroundColor=[UIColor orangeColor];
    
    [self.headerBgImageView addSubview:self.leftButton];
    
    //创建右按钮
    self.rightButton = [QuickControl initCustomButtonWithFrame:CGRectMake(screenWidth - 10 - 34, 25, 34, 44 - 5*2) title:nil titleColor:[UIColor whiteColor] background:[UIImage imageNamed:@"photo_right_nav.png"] image:nil target:self action:@selector(rightButtonClick:)];
    self.rightButton.backgroundColor=[UIColor greenColor];
    [self.headerBgImageView addSubview:self.rightButton];
}

//实现返回功能
-(void)dismVC{
     //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonClick:(UIButton *)button{
    //NSLog(@"这个方法需要在子类中重写");
    informationVC * IVC=[[informationVC alloc] init];
    [self.navigationController pushViewController:IVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
