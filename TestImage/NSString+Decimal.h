//
//  NSString+Compare.h
//  TestImage
//
//  Created by fengbang on 2019/12/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,FBCompareResult) {
    /**默认*/
    FBCompareResultDefult = 0,
    /**左边比右边大-递减*/
    FBCompareResultDescending,
    /**左边比右边小-递增*/
    FBCompareResultAscending,
    /**左边等于右边*/
    FBCompareResultSame,
    /**出错*/
    FBCompareResultError,
};

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Decimal)

#pragma mark - compare
/// string和float比较
/// @param f float参数
- (FBCompareResult)compareWithFloat:(CGFloat)f;

/// string和string比较
/// @param string string参数
- (FBCompareResult)compareWithString:(NSString *)string;

/// 两个浮点型比较
/// @param floatA floatA description
/// @param floatB floatB description
+ (FBCompareResult)compareFloatA:(CGFloat)floatA withFloatB:(CGFloat)floatB;

#pragma mark - adding

- (NSDecimalNumber *)byAddFloat:(CGFloat)f;

- (NSDecimalNumber *)byAddString:(NSString *)string;

#pragma mark - subtracting

- (NSDecimalNumber *)bySubtractFloat:(CGFloat)f;

- (NSDecimalNumber *)bySubtractString:(NSString *)string;


#pragma mark - multiplying

- (NSDecimalNumber *)byMultiplyFloat:(CGFloat)f;

- (NSDecimalNumber *)byMultiplyString:(NSString *)string;


#pragma mark - dividing

- (NSDecimalNumber *)byDivideFloat:(CGFloat)f;

- (NSDecimalNumber *)byDividesString:(NSString *)string;




@end

NS_ASSUME_NONNULL_END
