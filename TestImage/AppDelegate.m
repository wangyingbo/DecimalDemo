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
    
    NSString *string = @"1.2";
    double a = -1.2;
    double b = 1.2000;
    NSString *otherString = @"0";
    
    //测试向上进位规则
    NSString *money = [[@"5554681" byDivideString:@"150000"].stringValue byMultiplyDouble:100].stringValue;
    //money = @"";
    NSError *roundingError = nil;
    NSDecimalNumber *roundedOunces = [money roundingMode:NSRoundUp afterPoint:4 error:&roundingError];
    if (roundingError) {
        NSLog(@"roundingError:{domain:%@-code:%ld-des:%@}",
              roundingError.domain,
              (long)roundingError.code,
              roundingError.localizedDescription);
    }
    NSLog(@"向上进位值：%@",roundedOunces.stringValue);
    
    //测试NSDecimalNumber比较结果
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:string];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:otherString];
    NSComparisonResult result = [decimalNum1 compare:decimalNum2];
    NSLog(@"%ld",(long)result);
    
    //打印的浮点型和po命令出来的不一样
    NSLog(@"直接打印value-双精度：%.16f",string.doubleValue);
    NSLog(@"直接打印value-浮点型：%f",string.floatValue);
    NSLog(@"转为number的值双精度：%.16f",[NSNumber numberWithDouble:string.doubleValue].doubleValue);
    
    //测试封装的NSDecimalNumber比较结果
    switch ([string compareWithDouble:a]) {
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
    
    NSLog(@"加：%@",[string byAddDouble:b].stringValue);
    NSLog(@"减：%f",[string bySubtractDouble:b].doubleValue);
    NSLog(@"乘：%@",[string byMultiplyDouble:b].stringValue);
    NSLog(@"除：%f",[string byDivideDouble:b].doubleValue);
    
    [string compareWithString:otherString];
    
    //测试加减乘除
    [string byAddDouble:0];
    NSError *addError = nil;
    [string byAddString:otherString error:&addError];
    if (addError) {
        NSLog(@"addError:{domain:%@-code:%ld-des:%@}",
              addError.domain,
              (long)addError.code,
              addError.localizedDescription);
    }
    
    [string bySubtractDouble:0];
    NSError *subtractError = nil;
    [string bySubtractString:otherString error:&subtractError];
    if (subtractError) {
        NSLog(@"subtractError:{domain:%@-code:%ld-des:%@}",
              subtractError.domain,
              (long)subtractError.code,
              subtractError.localizedDescription);
    }
    
    [string byMultiplyDouble:0];
    NSError *multiplyError = nil;
    [string byMultiplyString:otherString error:&multiplyError];
    if (multiplyError) {
        NSLog(@"multiplyError:{domain:%@-code:%ld-des:%@}",
              multiplyError.domain,
              (long)multiplyError.code,
              multiplyError.localizedDescription);
    }
    
    [string byDivideDouble:0];
    NSError *divideError = nil;
    [string byDivideString:otherString error:&divideError];
    if (divideError) {
        NSLog(@"divideError:{domain:%@-code:%ld-des:%@}",
              divideError.domain,
              (long)divideError.code,
              divideError.localizedDescription);
    }
    
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
