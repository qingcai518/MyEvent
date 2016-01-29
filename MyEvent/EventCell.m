//
//  EventCell.m
//  MyEvent
//
//  Created by user on 2016/01/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import "EventCell.h"
#define nameFontSize 20
#define fontSize 12

@implementation EventCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void) initSubView {
    logo = [[UIImageView alloc]init];
    eventName = [[UILabel alloc]init];
    eventName.font = [UIFont systemFontOfSize:nameFontSize];
    time = [[UILabel alloc]init];
    time.font = [UIFont systemFontOfSize:fontSize];
    place = [[UILabel alloc]init];
    place.font = [UIFont systemFontOfSize:fontSize];
    status = [[UILabel alloc]init];
    
    [self addSubview:logo];
    [self addSubview:eventName];
    [self addSubview:time];
    [self addSubview:place];
    [self addSubview:status];
}

- (void)setEvent:(Event *)event {
    NSString *str_name = event.eventName;
    NSString *str_time = event.time;
    NSString *str_place = event.place;
    NSString *str_logoURL = event.logoURL;
    NSString *str_status = event.status;
    
    NSURL *imageURL = [NSURL URLWithString:str_logoURL];
    UIImage *placeholderImage = [UIImage imageNamed:@"350x150.png"];
    [logo sd_setImageWithURL:imageURL placeholderImage:placeholderImage];
    logo.frame = CGRectMake(10, 10, 120, 120);
    
    NSInteger positionX = CGRectGetMaxX(logo.frame);
    
    CGSize nameSize = [str_name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:nameFontSize]}];
    CGRect nameRect = CGRectMake(positionX + 10, 10, nameSize.width, nameSize.height);
    eventName.text = event.eventName;
    eventName.textColor = [UIColor blueColor];
    eventName.frame = nameRect;
    
    CGSize timeSize = [str_time sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    CGRect timeRect = CGRectMake(positionX + 10, 10 + CGRectGetMaxY(nameRect), timeSize.width, timeSize.height);
    time.text = event.time;
    time.frame = timeRect;

    CGSize placeSize = [str_place sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    CGRect placeRect = CGRectMake(positionX + 10, 10 + CGRectGetMaxY(timeRect), placeSize.width, placeSize.height);
    place.text = event.place;
    place.frame = placeRect;
    
    _height = CGRectGetMaxY(logo.frame) + 2 * 10;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
