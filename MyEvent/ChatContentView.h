#import <UIKit/UIKit.h>
@class ChatContentView,ChatMessage;

@protocol ChatContentViewDelegate <NSObject>

-(void)chatContentViewLongPress:(ChatContentView *)chatView content:(NSString *)content;
-(void)chatContentViewTapPress:(ChatContentView *)chatView content:(NSString *)content;

@end

@interface ChatContentView : UIView
@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) ChatMessage *chatMessage;
@property (nonatomic,assign) id <ChatContentViewDelegate> delegate;
@end
