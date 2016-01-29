//
//  EventCell.h
//  MyEvent
//
//  Created by user on 2016/01/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "UIImageView+WebCache.h"

@interface EventCell : UITableViewCell {
    UILabel *eventName;
    UILabel *time;
    UILabel *place;
    UILabel *status;
    UIImageView *logo;
}

@property (nonatomic, strong) Event *event;
@property (nonatomic, assign) CGFloat height;
@end
