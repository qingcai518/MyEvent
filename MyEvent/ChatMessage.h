typedef enum {
  
    kMessageFrom=0,
    kMessageTo
 
}ChatMessageType;
#import <Foundation/Foundation.h>

@interface ChatMessage : NSObject
@property (nonatomic,assign) ChatMessageType messageType;
@property (nonatomic, copy) NSString *icon;
//@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSDictionary *dict;
@end
