//
//  Home.m
//  fgxip
//
//  Created by User01 on 15/11/18.
//  Copyright © 2015年 User01. All rights reserved.
//

#import "Home.h"
#import "myTabBarController.h"

#import "attentionVC.h"
#import "informationVC.h"
#import "aboutVC.h"
#import "clickVC.h"
#import "BenevolenceVC.h"
#import "zixunVC.h"
#import "shareVC.h"
#import "setingVC.h"

#import "fgxViewController.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(wwww) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}



-(void)wwww
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"newsNotification" object:nil userInfo:nil];
//    UIImageView * vie=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
//    vie.backgroundColor=[UIColor blackColor];
//    vie.alpha=0.5;
//    [self.view addSubview:vie];
    fgxViewController * IVC=[[fgxViewController alloc] init];
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
