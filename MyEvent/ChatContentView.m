#define kContentStartMargin 25
#import "ChatContentView.h"
#import "ChatMessage.h"
@implementation ChatContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backImageView=[[UIImageView alloc]init];
        self.backImageView.userInteractionEnabled=YES;
        [self addSubview:self.backImageView];
        
        self.contentLabel=[[UILabel alloc]init];
        self.contentLabel.numberOfLines=0;
        self.contentLabel.textAlignment=NSTextAlignmentLeft;
        self.contentLabel.font=[UIFont fontWithName:@"HelveticaNeue" size:13];
        [self addSubview:self.contentLabel];

        [self addGestureRecognizer: [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];

        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPress:)]];
    }
    return self;
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.backImageView.frame=self.bounds;
    CGFloat contentLabelX=0;
    if(self.chatMessage.messageType==kMessageFrom){
     
        contentLabelX=kContentStartMargin*0.8;
    }else if(self.chatMessage.messageType==kMessageTo){
        contentLabelX=kContentStartMargin*0.5;
    }
    self.contentLabel.frame=CGRectMake(contentLabelX, -3, self.frame.size.width-kContentStartMargin-5, self.frame.size.height);

}
-(void)longTap:(UILongPressGestureRecognizer *)longTap
{
    if([self.delegate respondsToSelector:@selector(chatContentViewLongPress:content:)]){
        
        [self.delegate chatContentViewLongPress:self content:self.contentLabel.text];
    }
}
-(void)tapPress:(UILongPressGestureRecognizer *)tapPress
{
    if([self.delegate respondsToSelector:@selector(chatContentViewTapPress:content:)]){
    
        [self.delegate chatContentViewTapPress:self content:self.contentLabel.text];
    }
}
@end
