#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ChatMessage.h"
@interface ChatCellFrame : NSObject
@property (nonatomic,assign) CGRect iconRect;
@property (nonatomic,assign) CGRect chatViewRect;
@property (nonatomic,strong) ChatMessage *chatMessage;
@property (nonatomic, assign) CGFloat cellHeight; //cell高度
@end
