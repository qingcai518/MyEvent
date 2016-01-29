//
//  Event.h
//  MyEvent
//
//  Created by user on 2016/01/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *place;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *logoURL;
@end
