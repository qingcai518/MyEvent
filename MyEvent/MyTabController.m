//
//  MyTabController.m
//  MyEvent
//
//  Created by user on 2016/01/18.
//  Copyright © 2016年 user. All rights reserved.
//

#import "MyTabController.h"

@interface MyTabController ()

@end

@implementation MyTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EventViewController *vc1 = [[EventViewController alloc]init];
    vc1.tabBarItem.title=@"活动";
    vc1.tabBarItem.image=[UIImage imageNamed:@"football.png"];
    
    MessageViewController *vc2 = [[MessageViewController alloc]init];
    vc2.tabBarItem.title=@"消息";
    vc2.tabBarItem.image=[UIImage imageNamed:@"message.png"];
    vc2.tabBarItem.badgeValue=@"11";

    UIViewController *vc3=[[UIViewController alloc]init];
    vc3.view.backgroundColor=[UIColor brownColor];
    vc3.tabBarItem.title=@"联系人";
    vc3.tabBarItem.image=[UIImage imageNamed:@"contacts.png"];

    UIViewController *vc4=[[UIViewController alloc]init];
    vc4.tabBarItem.title=@"动态";
    vc4.tabBarItem.image=[UIImage imageNamed:@"star.png"];
    
    UIViewController *vc5=[[UIViewController alloc]init];
    vc5.tabBarItem.title=@"设置";
    vc5.tabBarItem.image=[UIImage imageNamed:@"setting.png"];
    
    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
    
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.09 green:0.73 blue:0.83 alpha:1.0];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UITabBar appearance].barTintColor = [UIColor whiteColor];
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
