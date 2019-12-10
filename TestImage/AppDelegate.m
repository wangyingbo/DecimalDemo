//
//  AppDelegate.m
//  TestImage
//
//  Created by fengbang on 2019/10/28.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "AppDelegate.h"
#import "NSString+Decimal.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSString *string = @"";
    CGFloat a = -1.2f;
    CGFloat b = 1.2000f;
    NSString *otherString = @"";
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:string];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:otherString];
    NSComparisonResult result = [decimalNum1 compare:decimalNum2];
    NSLog(@"%ld",(long)result);
    
    //打印的浮点型和po命令出来的不一样
    NSLog(@"直接打印value-双精度：%.16f",string.doubleValue);
    NSLog(@"直接打印value-浮点型：%f",string.floatValue);
    NSLog(@"转为number的值双精度：%.16f",[NSNumber numberWithDouble:string.doubleValue].doubleValue);
    
    switch ([string compareWithFloat:a]) {
        case FBCompareResultAscending:
            NSLog(@"左边<右边");
            break;
        case FBCompareResultSame:
            NSLog(@"左边=右边");
            break;
        case FBCompareResultDescending:
            NSLog(@"左边>右边");
            break;
        case FBCompareResultError:
            NSLog(@"比较大小出错了");
            break;
        default:
            NSLog(@"默认值");
            break;
    }
    
    NSLog(@"加：%@",[string byAddFloat:b].stringValue);
    NSLog(@"减：%f",[string bySubtractFloat:b].floatValue);
    NSLog(@"乘：%@",[string byMultiplyFloat:b].stringValue);
    NSLog(@"除：%f",[string byDivideFloat:b].floatValue);
    
    
    [string compareWithString:otherString];
    
    [string byAddString:otherString];
    [string byAddFloat:0];
    
    [string bySubtractFloat:0];
    [string bySubtractString:otherString];
    
    [string byMultiplyString:otherString];
    [string byMultiplyFloat:0];
    
    [string byDivideFloat:0];
    [string byDividesString:otherString];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
