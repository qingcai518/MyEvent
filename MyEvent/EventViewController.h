//
//  ViewController.h
//  MyEvent
//
//  Created by user on 2016/01/18.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "EventCell.h"
#import "Event.h"

@interface EventViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UITableViewStyle style;
    UITableView *eventView;
    NSMutableArray *events;
}
//- (id)initWithStyle:(UITableViewStyle)theStyle;

@end

