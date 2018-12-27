//
//  Example
//  man
//
//  Created by man on 11/11/2018.
//  Copyright © 2018 man. All rights reserved.
//

#import "OCLogModel.h"
#import "OCLoggerFormat.h"
#import "NetworkHelper.h"
#import "NSObject+CocoaDebug.h"

@implementation OCLogModel

- (instancetype)initWithContent:(NSString *)content color:(UIColor *)color fileInfo:(NSString *)fileInfo isTag:(BOOL)isTag unicodeToChinese:(BOOL)unicodeToChinese
{
    if (self = [super init]) {
        
        self.Id = [[NSUUID UUID] UUIDString];
        self.fileInfo = fileInfo;
        self.date = [NSDate date];
        self.color = color;
        self.isTag = isTag;
        self.content = unicodeToChinese ? [NSString unicodeToChinese:content] : content;
        
        /////////////////////////////////////////////////////////////////////////
        
        NSInteger startIndex = 0;
        NSInteger lenghtDate = 0;
        NSString *stringContent = @"";
        
        stringContent = [stringContent stringByAppendingFormat:@"[%@]", [OCLoggerFormat formatDate:self.date]];
        lenghtDate = [stringContent length];
        startIndex = [stringContent length];
        
        if (self.fileInfo) {
            stringContent = [stringContent stringByAppendingFormat:@"%@%@", self.fileInfo, self.content];
        }else{
            stringContent = [stringContent stringByAppendingFormat:@"%@", self.content];
        }
    
        NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc] initWithString:stringContent];
        [attstr addAttribute:NSForegroundColorAttributeName value:self.color range:NSMakeRange(0, [stringContent length])];
        
        NSRange range = NSMakeRange(0, lenghtDate);
        [attstr addAttribute:NSForegroundColorAttributeName value: [[NetworkHelper shared] mainColor] range: range];
        [attstr addAttribute:NSFontAttributeName value: [UIFont boldSystemFontOfSize:12] range: range];
        
        NSRange range2 = NSMakeRange(startIndex, self.fileInfo.length);
        [attstr addAttribute: NSForegroundColorAttributeName value: [UIColor grayColor]  range: range2];
        [attstr addAttribute: NSFontAttributeName value: [UIFont boldSystemFontOfSize:12] range: range2];
        
        
        //换行
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        
        NSRange rang3 = NSMakeRange(0, attstr.length);
        [attstr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:rang3];
        
        
        //
        self.str = stringContent;
        self.attr = [attstr copy];
    }
    
    return self;
}

@end
