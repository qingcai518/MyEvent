#import "ChatCell.h"
#import "ChatContentView.h"
@interface ChatCell()<ChatContentViewDelegate>
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) ChatContentView *chatView;
@property (nonatomic,strong) ChatContentView *currentChatView;
@property (nonatomic,strong) NSString *contentStr;
@end

@implementation ChatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.icon=[[UIImageView alloc]init];
        [self.contentView addSubview:self.icon];
        self.chatView =[[ChatContentView alloc]initWithFrame:CGRectZero];
        self.chatView.delegate=self;
        [self.contentView addSubview:self.chatView];
    }
    return self;
}
-(void)setCellFrame:(ChatCellFrame *)cellFrame
{
   
    _cellFrame=cellFrame;
    
    ChatMessage *chatMessage=cellFrame.chatMessage;
    
    self.icon.frame=cellFrame.iconRect;
    self.icon.image=[UIImage imageNamed:chatMessage.icon];
   
    self.chatView.chatMessage=chatMessage;
    self.chatView.frame=cellFrame.chatViewRect;
    [self setBackGroundImageViewImage:self.chatView from:@"chatfrom_bg_normal.png" to:@"chatto_bg_normal.png"];
    self.chatView.contentLabel.text=chatMessage.content;
    
}
-(void)setBackGroundImageViewImage:(ChatContentView *)chatView from:(NSString *)from to:(NSString *)to
{
    UIImage *normal=nil ;
    if(chatView.chatMessage.messageType==kMessageFrom){
        
        normal = [UIImage imageNamed:from];
        normal = [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.7];
        
    }else if(chatView.chatMessage.messageType==kMessageTo){
        
        normal = [UIImage imageNamed:to];
        normal = [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.7];
    }
    chatView.backImageView.image=normal;
}
-(void)chatContentViewLongPress:(ChatContentView *)chatView content:(NSString *)content
{
    [self becomeFirstResponder];
    UIMenuController *menu=[UIMenuController sharedMenuController];
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuShow:) name:UIMenuControllerWillShowMenuNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuHide:) name:UIMenuControllerWillHideMenuNotification object:nil];
    self.contentStr=content;
    self.currentChatView=chatView;
}
-(void)chatContentViewTapPress:(ChatContentView *)chatView content:(NSString *)content
{
    if([self.delegate respondsToSelector:@selector(chatCell:tapContent:)]){
    
    
        [self.delegate chatCell:self tapContent:content];
    }
}
-(void)menuShow:(UIMenuController *)menu
{
    [self setBackGroundImageViewImage:self.currentChatView from:@"chatfrom_bg_focused.png" to:@"chatto_bg_focused.png"];
}
-(void)menuHide:(UIMenuController *)menu
{
    [self setBackGroundImageViewImage:self.currentChatView from:@"chatfrom_bg_normal.png" to:@"chatto_bg_normal.png"];
    self.currentChatView=nil;
    [self resignFirstResponder];
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if(action ==@selector(copy:)){

        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

-(void)copy:(id)sender
{
    [[UIPasteboard generalPasteboard]setString:self.contentStr];
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
