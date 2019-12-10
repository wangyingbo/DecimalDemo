//
//  NSString+Compare.m
//  TestImage
//
//  Created by fengbang on 2019/12/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "NSString+Decimal.h"


@implementation NSString (Decimal)

#pragma mark - compare
- (FBCompareResult)compareWithFloat:(CGFloat)f {
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:f].decimalValue];
    
    return compareDecimal(decimalNum1, decimalNum2);
}

- (FBCompareResult)compareWithString:(NSString *)string {
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    return compareDecimal(decimalNum1, decimalNum2);
}

+ (FBCompareResult)compareFloatA:(CGFloat)floatA withFloatB:(CGFloat)floatB
{
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:floatA].decimalValue];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:floatB].decimalValue];
    
    return compareDecimal(decimalNum1, decimalNum2);
}

/// 比较两个num的大小
/// @param num1 num1 description
/// @param num2 num1 description
NS_INLINE FBCompareResult compareDecimal(NSDecimalNumber *num1, NSDecimalNumber *num2) {
    
    FBCompareResult result = FBCompareResultDefult;
    if ([num1 isEqualToNumber:NSDecimalNumber.notANumber] || [num2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        result = FBCompareResultError;
        return result;
    }
    
    NSComparisonResult comparison = [num1 compare:num2];
    switch (comparison) {
        case NSOrderedAscending:
        {
            result = FBCompareResultAscending;
        }
            break;
        case NSOrderedSame:
        {
            result = FBCompareResultSame;
        }
            break;
        case NSOrderedDescending:
        {
            result = FBCompareResultDescending;
        }
            break;
            
        default:
        {
            result = FBCompareResultError;
        }
            break;
    }
    return result;
}

#pragma mark - adding

- (NSDecimalNumber *)byAddFloat:(CGFloat)f {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:f].decimalValue];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByAdding:decimalNum2];
    return result;
}

- (NSDecimalNumber *)byAddString:(NSString *)string {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByAdding:decimalNum2];
    return result;
}

#pragma mark - subtracting

- (NSDecimalNumber *)bySubtractFloat:(CGFloat)f {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:f].decimalValue];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:-f].decimalValue];;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberBySubtracting:decimalNum2];
    return result;
}

- (NSDecimalNumber *)bySubtractString:(NSString *)string {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:-decimalNum2.floatValue].decimalValue];;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberBySubtracting:decimalNum2];
    return result;
}

#pragma mark - multiplying

- (NSDecimalNumber *)byMultiplyFloat:(CGFloat)f {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:f].decimalValue];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.one;
        }
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByMultiplyingBy:decimalNum2];
    return result;
}

- (NSDecimalNumber *)byMultiplyString:(NSString *)string {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.one;
        }
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByMultiplyingBy:decimalNum2];
    return result;
}

#pragma mark - dividing

- (NSDecimalNumber *)byDivideFloat:(CGFloat)f {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:f].decimalValue];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.zero]) {
        decimalNum2 = NSDecimalNumber.one;
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByDividingBy:decimalNum2];
    return result;
}

- (NSDecimalNumber *)byDividesString:(NSString *)string {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.zero]) {
        decimalNum2 = NSDecimalNumber.one;
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByDividingBy:decimalNum2];
    return result;
}

@end
