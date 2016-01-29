//
//  MessageViewController.m
//  MyEvent
//
//  Created by user on 2016/01/25.
//  Copyright © 2016年 user. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"押してね" forState:UIControlStateNormal];
    [btn setTitle:@"ぽち" forState:UIControlStateHighlighted];
    [btn setTitle:@"押せません" forState:UIControlStateDisabled];
    // ボタンがタッチダウンされた時にhogeメソッドを呼び出す
    [btn addTarget:self action:@selector(openChat:)
  forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 呼ばれるhogeメソッド
-(void)openChat:(UIButton*)button{
    ChatViewController * nextController = [[ChatViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end
