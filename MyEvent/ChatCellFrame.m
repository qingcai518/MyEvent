#define kIconMarginX 5
#define kIconMarginY 5

#import "ChatCellFrame.h"

@implementation ChatCellFrame

-(void)setChatMessage:(ChatMessage *)chatMessage
{
    _chatMessage=chatMessage;
    
    CGSize winSize=[UIScreen mainScreen].bounds.size;
    CGFloat iconX=kIconMarginX;
    CGFloat iconY=kIconMarginY;
    CGFloat iconWidth=40;
    CGFloat iconHeight=40;
    
    if(chatMessage.messageType==kMessageFrom){
      
    }else if (chatMessage.messageType==kMessageTo){
        iconX=winSize.width-kIconMarginX-iconWidth;
    }
    self.iconRect=CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    CGFloat contentX=CGRectGetMaxX(self.iconRect)+kIconMarginX;
    CGFloat contentY=iconY;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:13]};
    CGSize contentSize=[chatMessage.content boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    if(chatMessage.messageType==kMessageTo){
    
        contentX=iconX-kIconMarginX-contentSize.width-iconWidth;
    }
    
    self.chatViewRect=CGRectMake(contentX, contentY, contentSize.width+35, contentSize.height+30);
    
    self.cellHeight=MAX(CGRectGetMaxY(self.iconRect), CGRectGetMaxY(self.chatViewRect))+kIconMarginX;
}
@end
