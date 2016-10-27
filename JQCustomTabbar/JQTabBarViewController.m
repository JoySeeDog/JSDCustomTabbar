//
//  JQTabBarViewController.m
//  JQCustomTabbar
//
//  Created by jianquan on 2016/10/26.
//  Copyright © 2016年 JoySeeDog. All rights reserved.
//


#define BACKGROUND_IMAGE                                           (__bridge id)[UIImage imageNamed:@"application_bg"].CGImage

#import "JQTabBarViewController.h"
#import "ViewController.h"


@interface JQTabBarViewController ()

@end

@implementation JQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewController *viewController0 = [[ViewController alloc] init];
    viewController0.view.backgroundColor = [UIColor redColor];
    
    
    ViewController *viewController1 = [[ViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor grayColor];
    
    
    ViewController *viewController2= [[ViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor blueColor];
    
    
    ViewController *viewController3 = [[ViewController alloc] init];
    viewController3.view.backgroundColor = [UIColor whiteColor];
    
    
    ViewController *viewController4 = [[ViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor greenColor];
    
    self.viewControllers = @[viewController0,viewController1,viewController2,viewController3,viewController4];
    
    [self setupTabBar];
    
}

- (void)setupTabBar {
    

//  12092c
    [[UITabBar appearance] setBarTintColor:[UIColor purpleColor]];
    //取消tabBar的透明效果。
    [UITabBar appearance].translucent = NO;
    
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        
        switch (idx) {
            case 0:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_camera_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main_camera_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"首页";
                
            } break;
            case 1:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_like_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main_like_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"关注";
                
                
            } break;
            case 2:{
                obj.tabBarItem.enabled=NO;
                obj.tabBarItem.title=@"";
                
            } break;
            case 3:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_crown_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main_crown_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"榜单";
                
            } break;
            case 4:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_history_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main_history_current"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"历史";
           
            } break;
           
            default:
                break;
        }
    }];
    
    //修改文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor greenColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
     
    self.customSelectViews  = [[NSMutableArray alloc] init];
    
    for (UIView *UITabBarButton in self.tabBar.subviews) {
     
        if ([@"UITabBarButton" isEqualToString:NSStringFromClass([UITabBarButton class])]) {
          
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UITabBarButton.frame.origin.x+UITabBarButton.frame.size.width/2-5, UITabBarButton.frame.origin.y+UITabBarButton.frame.size.height-5, 10, 5)];
            imageView.image = [UIImage imageNamed:@"main_point"];
            [self.tabBar addSubview:imageView];
            [self.customSelectViews addObject:imageView];
            
        }
    }
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-37.5 , -15, 75, 75)];
    
    button.layer.cornerRadius = 37.5;
    button.layer.masksToBounds = YES;
    
    [button setBackgroundColor:[UIColor purpleColor]];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:[UIImage imageNamed:@"main_live"] forState:UIControlStateNormal];
    [self.tabBar addSubview:button];
    [self.tabBar bringSubviewToFront:button];
    [button addTarget:self action:@selector(selectImagePicker) forControlEvents:UIControlEventTouchUpInside];


}

- (void)selectImagePicker {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机",@"相册", nil];
    [sheet showInView:self.view];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
