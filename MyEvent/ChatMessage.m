#import "ChatMessage.h"

@implementation ChatMessage

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;

    self.icon=dict[@"icon"];
//    self.time=dict[@"time"];
    self.content=dict[@"content"];
    self.messageType=[dict[@"type"] intValue];
}
@end
