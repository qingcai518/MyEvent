#import <UIKit/UIKit.h>
@class ChatCell;

@protocol ChatCellDelegate <NSObject>

-(void)chatCell:(ChatCell *)chatCell tapContent:(NSString *)content;

@end

#import "ChatCellFrame.h"
@interface ChatCell : UITableViewCell
@property (nonatomic,strong) ChatCellFrame *cellFrame;
@property (nonatomic,assign) id<ChatCellDelegate> delegate;
@end
