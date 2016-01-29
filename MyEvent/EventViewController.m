//
//  ViewController.m
//  MyEvent
//
//  Created by user on 2016/01/18.
//  Copyright © 2016年 user. All rights reserved.
//

#import "EventViewController.h"
#define URL @"http://myreader.main.jp/service.php"

@interface EventViewController ()

@end

@implementation EventViewController


- (id)initWithStyle:(UITableViewStyle)theStyle
{
    self = [super init];
    if (self != nil) {
        style = theStyle;
    }
    return self;
}

- (void)loadView {
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    eventView = [[UITableView alloc] initWithFrame:view.bounds style:style];
    eventView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    eventView.dataSource = self;
    eventView.delegate = self;
    
    [view addSubview:eventView];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    [self makeRequests:URL type:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// access server
- (void)makeRequests:(NSString *)query type:(BOOL)isType {
    
    NSURL *url = [NSURL URLWithString:query];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:[url absoluteString] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        events = [[NSMutableArray alloc]init];
        Event *event = [[Event alloc]init];
        event.eventName = @"フットサル練習";
        event.time = @"2015/1/20 10:00~11:00";
        event.place = @"浮間舟渡フットサルパーク";
        event.logoURL = @"http://shisetsu.jp/city.itabashi/ukimafunado-futsalpark/images/top_img@2x.jpg";
        event.status = @"募集中";
        
        [events addObject:event];
        [eventView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellId = @"id1";
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[EventCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    Event *event = events[indexPath.row];
    
    cell.event = event;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    EventCell *cell = [[EventCell alloc]init];
    cell.event = events[indexPath.row];
    return cell.height;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
