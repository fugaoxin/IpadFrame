//
//  myTabBarController.m
//  UITabBarController zidingyiDemo
//
//  Created by QF on 15-6-16.
//  Copyright (c) 2015年 QF. All rights reserved.
//

#import "myTabBarController.h"
#import "informationVC.h"


@interface myTabBarController ()

@property(nonatomic,strong)UIViewController *currentViewController;

@property (nonatomic,strong) UIButton * currentSelectedButton;
@property (nonatomic,strong) NSArray * vcArray;
@property (nonatomic,strong) NSArray * photoArray;
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,strong) NSArray * selectedPhotoArray;

@property(nonatomic,strong) UIImageView * mainView;
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;

@end

@implementation myTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NEWS:) name:@"newsNotification" object:nil];
}

-(void)NEWS:(NSNotification *)notification
{
    UIImageView * vie=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    vie.backgroundColor=[UIColor blackColor];
    vie.alpha=0.5;
    [self.view addSubview:vie];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"newsNotification" object:nil];
}

-(void)setTabBarControllerWithVCArray:(NSArray *)vcArray andPhotoArray:(NSArray *)photoArray selectedPhotoArray:(NSArray *)selectedPhotoArray titleArray:(NSArray *)titleArray{
    
    UIViewController *fVC = [[[vcArray objectAtIndex:0]alloc]init];
    
    //fVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    fVC.view.frame = CGRectMake(64, 0, screenWidth-64, self.view.frame.size.height);
    
    //将fVC设置为当前控制器
    self.currentViewController = fVC;
    
    [self.view addSubview:fVC.view];
    
    [self addChildViewController:fVC];
    
    self.photoArray = photoArray;
    
    self.titleArray = titleArray;
    
    self.vcArray = vcArray;
    
    self.selectedPhotoArray = selectedPhotoArray;
    
    //必须要都有值
    if (!(self.photoArray.count > 0 && self.titleArray.count > 0 && self.vcArray.count > 0)) {
        return;
    }
    [self setNavigationBar];
    [self setTabBar];
}

-(void)setNavigationBar{
    self.mainView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
    self.mainView.userInteractionEnabled = YES;
    self.mainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainView];
    
    UILabel * lane1=[[UILabel alloc] initWithFrame:CGRectMake(0, 63, screenWidth, 1)];
    lane1.backgroundColor=[UIColor grayColor];
    lane1.alpha=0.4;
    [self.mainView addSubview:lane1];
    
    //设置title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, screenWidth-100, 44)];
    self.titleLabel.textColor=[UIColor blackColor];
    self.titleLabel.userInteractionEnabled=YES;
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    [self.mainView addSubview:self.titleLabel];
    
    //创建左按钮
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 25, 34, 44 - 5*2)];
    self.leftButton.backgroundColor=[UIColor orangeColor];
    [self.leftButton addTarget:self action:@selector(dismVC) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:self.leftButton];
    
    //创建右按钮
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - 10 - 34, 25, 34, 44 - 5*2)];
    self.rightButton.backgroundColor=[UIColor greenColor];
    [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:self.rightButton];
}

//实现返回功能
-(void)dismVC{
    //     [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonClick:(UIButton *)button{
    NSLog(@"这个方法需要在子类中重写");
    informationVC * IVC=[[informationVC alloc] init];
//    [self presentViewController:IVC animated:YES completion:^{
//        
//    }];
    [self.navigationController pushViewController:IVC animated:YES];
}

-(void)setTabBar{
    
    //设置tabBar的背景颜色
    self.tabBarBgImageView = [[UIImageView alloc]init];
    //self.tabBarBgImageView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    self.tabBarBgImageView.frame = CGRectMake(0, 64, 64, screenHeight);
    self.tabBarBgImageView.userInteractionEnabled = YES;
    self.tabBarBgImageView.backgroundColor = [UIColor whiteColor];
    //self.tabBarBgImageView.image=[UIImage imageNamed:@"fgxx.png"];
    [self.view addSubview:self.tabBarBgImageView];
    
    UILabel * lane2=[[UILabel alloc] initWithFrame:CGRectMake(63, 0, 1, screenHeight-64)];
    lane2.backgroundColor=[UIColor grayColor];
    lane2.alpha=0.4;
    [self.tabBarBgImageView addSubview:lane2];
    
    //设置底部栏的四个按钮
    for (int i = 0; i < self.photoArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //button.frame  = CGRectMake(i*(self.view.frame.size.width/self.photoArray.count)+5, 2, self.view.frame.size.width/self.photoArray.count-10, 46);
        button.frame  = CGRectMake(2, i*((screenHeight-64)/self.photoArray.count)+5, 60, (screenHeight-64)/self.photoArray.count-10);
        //button.backgroundColor=[UIColor redColor];
        [button setTitle:[self.titleArray objectAtIndex:i] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:[self.photoArray objectAtIndex:i]] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:[self.selectedPhotoArray objectAtIndex:i]] forState:UIControlStateSelected];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        
        //设置图片和文字位置
//        button.titleEdgeInsets = UIEdgeInsetsMake(0, -30, -30, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(-15, -8, 0, -35);
//        
//        if (i==self.photoArray.count-1) {
//            
//            button.titleEdgeInsets = UIEdgeInsetsMake(0, -21, -30, 0);
//        }
        
        button.tag = i;
        
        if (button.tag == 0) {
            button.selected = YES;
            self.currentSelectedButton = button;
            //self.title=self.titleArray[0];
            self.titleLabel.text=self.titleArray[0];
            //self.titleLabel.textColor=[UIColor blackColor];
        }
        
        [button addTarget:self action:@selector(vcChangeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBarBgImageView addSubview:button];
    }
    
    
}




#pragma mark - 响应点击button切换视图事件
-(void)vcChangeButtonClick:(UIButton *)button{
    //先把当前的vc释放掉
    [self.currentViewController.view removeFromSuperview];
    [self.currentViewController removeFromParentViewController];
    
    self.currentSelectedButton.selected = NO;
    
    for (int i = 0; i < self.photoArray.count; i++) {
        if (i == button.tag) {
            UIViewController *fVC = [[[self.vcArray objectAtIndex:i]alloc]init];
            
            //fVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            fVC.view.frame = CGRectMake(64, 64, screenWidth-64, self.view.frame.size.height);
            
            //将fVC设置为当前控制器
            self.currentViewController = fVC;
            
            [self.view addSubview:fVC.view];
            
            [self addChildViewController:fVC];
            
            button.selected = YES;
            self.currentSelectedButton = button;
            
            //self.title=self.titleArray[i];
            self.titleLabel.text=self.titleArray[i];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
