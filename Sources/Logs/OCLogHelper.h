//
//  Example
//  man
//
//  Created by man on 11/11/2018.
//  Copyright © 2018 man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OCLogHelper : NSObject

@property (nonatomic, assign) BOOL enable;

+ (instancetype)shared;

- (void)handleLogWithFile:(NSString *)file function:(NSString *)function line:(NSInteger)line message:(NSString *)message color:(UIColor *)color unicodeToChinese:(BOOL)unicodeToChinese;

@end
