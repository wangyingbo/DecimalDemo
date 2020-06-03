//
//  NSString+Compare.m
//  TestImage
//
//  Created by fengbang on 2019/12/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "NSString+Decimal.h"

NSString * const DecimalErrorNotANumberDomain = @"DecimalErrorNotANumberDomain";
NSString * const DecimalErrorDivideByZeroDomain = @"DecimalNumberDivideByZeroException";

static NSString * const kFirstError = @"the first parameter can not be a decimalNumber";
static NSString * const kSecondError = @"the second parameter can not be a decimalNumber";
static NSString * const kDivideByZeroError = @"NSDecimalNumber divide by zero exception";

@implementation NSString (Decimal)

#pragma mark - compare
- (FBCompareResult)compareWithDouble:(double)d {
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:d].decimalValue];
    
    return compareDecimal(decimalNum1, decimalNum2);
}

- (FBCompareResult)compareWithString:(NSString *)string {
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    return compareDecimal(decimalNum1, decimalNum2);
}

+ (FBCompareResult)compareDoubleA:(double)doubleA withDoubleB:(double)doubleB
{
    
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:doubleA].decimalValue];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:doubleB].decimalValue];
    
    return compareDecimal(decimalNum1, decimalNum2);
}

/// 比较两个num的大小
/// @param num1 num1 description
/// @param num2 num1 description
inline FBCompareResult compareDecimal(NSDecimalNumber *num1, NSDecimalNumber *num2) {
    
    FBCompareResult result = FBCompareResultDefault;
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

- (NSDecimalNumber *)byAddDouble:(double)d {
    return [self byAddDouble:d error:nil];
}

- (NSDecimalNumber *)byAddString:(NSString *)string {
    return [self byAddString:string error:nil];
}

- (NSDecimalNumber *)byAddDouble:(double)d error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:d].decimalValue];
    
    return addDecimal(decimalNum1, decimalNum2, error);
}

- (NSDecimalNumber *)byAddString:(NSString *)string error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    return addDecimal(decimalNum1, decimalNum2, error);
}

inline NSDecimalNumber * addDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error) {
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeFirstNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kFirstError}];
        }
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeSecondNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kSecondError}];
        }
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

- (NSDecimalNumber *)bySubtractDouble:(double)d {
    return [self bySubtractDouble:d error:nil];
}

- (NSDecimalNumber *)bySubtractString:(NSString *)string {
    return [self bySubtractString:string error:nil];
}

- (NSDecimalNumber *)bySubtractDouble:(double)d error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:d].decimalValue];
    
    return subtractDecimal(decimalNum1, decimalNum2, error);
}

- (NSDecimalNumber *)bySubtractString:(NSString *)string error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    return subtractDecimal(decimalNum1, decimalNum2, error);
}

inline NSDecimalNumber * subtractDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error) {
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeFirstNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kFirstError}];
        }
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithFloat:-decimalNum2.floatValue].decimalValue];;
        }else {
            return NSDecimalNumber.zero;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeSecondNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kSecondError}];
        }
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

- (NSDecimalNumber *)byMultiplyDouble:(double)d {
    return [self byMultiplyDouble:d error:nil];
}

- (NSDecimalNumber *)byMultiplyString:(NSString *)string {
    return [self byMultiplyString:string error:nil];
}

- (NSDecimalNumber *)byMultiplyDouble:(double)d error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:d].decimalValue];
    
    return multiplyDecimal(decimalNum1, decimalNum2, error);
}

- (NSDecimalNumber *)byMultiplyString:(NSString *)string error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    return multiplyDecimal(decimalNum1, decimalNum2, error);
}

inline NSDecimalNumber * multiplyDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error) {
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeFirstNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kFirstError}];
        }
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeSecondNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kSecondError}];
        }
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

- (NSDecimalNumber *)byDivideDouble:(double)d {
    return [self byDivideDouble:d error:nil];
}

- (NSDecimalNumber *)byDivideString:(NSString *)string {
    return [self byDivideString:string error:nil];
}

- (NSDecimalNumber *)byDivideDouble:(double)d error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:d].decimalValue];
    
    return divideDecimal(decimalNum1, decimalNum2, error);
}

- (NSDecimalNumber *)byDivideString:(NSString *)string error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *decimalNum1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *decimalNum2 = [NSDecimalNumber decimalNumberWithString:string];
    
    return divideDecimal(decimalNum1, decimalNum2, error);
}

inline NSDecimalNumber * divideDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error) {
    //判断是否存在
    if ([decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeFirstNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kFirstError}];
        }
        if (![decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum2;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeSecondNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kSecondError}];
        }
        if (![decimalNum1 isEqualToNumber:NSDecimalNumber.notANumber]) {
            return decimalNum1;
        }else {
            return NSDecimalNumber.one;
        }
    }
    if ([decimalNum2 isEqualToNumber:NSDecimalNumber.zero]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorDivideByZeroDomain
                code:DecimalErrorCodeDivideByZero
            userInfo:@{NSLocalizedDescriptionKey:kDivideByZeroError}];
        }
        decimalNum2 = NSDecimalNumber.one;
    }
    
    NSDecimalNumber *result = [decimalNum1 decimalNumberByDividingBy:decimalNum2];
    return result;
}

#pragma mark - rounding

- (NSDecimalNumber *)roundingMode:(NSRoundingMode)mode afterPoint:(NSInteger)position error:(NSError *__autoreleasing  _Nullable * _Nullable)error {
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:self];
    
    return roundingDecimal(ouncesDecimal, mode, position, error);
}

+ (NSDecimalNumber *)roundingDouble:(double)d mode:(NSRoundingMode)mode afterPoint:(NSInteger)position error:(NSError *__autoreleasing  _Nullable *)error {
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:d].decimalValue];
    
    return roundingDecimal(ouncesDecimal, mode, position, error);
}

inline NSDecimalNumber * roundingDecimal(NSDecimalNumber *ouncesDecimal,NSRoundingMode mode,NSInteger scale, NSError **error) {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    if ([ouncesDecimal isEqualToNumber:NSDecimalNumber.notANumber]) {
        if (error) {
            *error = [NSError errorWithDomain:DecimalErrorNotANumberDomain
                code:DecimalErrorCodeFirstNotANumber
            userInfo:@{NSLocalizedDescriptionKey:kFirstError}];
        }
        ouncesDecimal = NSDecimalNumber.zero;
    }
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return roundedOunces;
}

@end
