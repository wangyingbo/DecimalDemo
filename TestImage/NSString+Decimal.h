//
//  NSString+Compare.h
//  TestImage
//
//  Created by fengbang on 2019/12/9.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/**小数比较结果*/
typedef NS_ENUM(NSInteger,FBCompareResult) {
    /**默认*/
    FBCompareResultDefault = 0,
    /**左边比右边大-递减*/
    FBCompareResultDescending,
    /**左边比右边小-递增*/
    FBCompareResultAscending,
    /**左边等于右边*/
    FBCompareResultSame,
    /**出错*/
    FBCompareResultError,
};

/**错误码*/
typedef NS_ENUM(NSInteger,DecimalErrorCode) {
    /**第一个参数不能被初始化为NSDecimalNumber对象*/
    DecimalErrorCodeFirstNotANumber = 1,
    /**第二个参数不能被初始化为NSDecimalNumber对象*/
    DecimalErrorCodeSecondNotANumber,
    /**分母为0时的code*/
    DecimalErrorCodeDivideByZero,
};

/**不能被初始化为NSDecimalNumber对象时errorDomain*/
extern NSString * const DecimalErrorNotANumberDomain;
/**分母为0时errorDomain*/
extern NSString * const DecimalErrorDivideByZeroDomain;


@interface NSString (Decimal)

#pragma mark - extern "C"

extern FBCompareResult compareDecimal(NSDecimalNumber *num1, NSDecimalNumber *num2);
extern NSDecimalNumber * addDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error);
extern NSDecimalNumber * subtractDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error);
extern NSDecimalNumber * multiplyDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error);
extern NSDecimalNumber * divideDecimal(NSDecimalNumber *decimalNum1,NSDecimalNumber *decimalNum2,NSError **error);
extern NSDecimalNumber * roundingDecimal(NSDecimalNumber *ouncesDecimal,NSRoundingMode mode,NSInteger scale, NSError **error);
extern NSDecimalNumber * roundingDecimalHandler(NSDecimalNumber *ouncesDecimal,NSRoundingMode mode,NSInteger scale,bool raiseOnExactness,bool raiseOnOverflow,bool raiseOnUnderflow,bool raiseOnDivideByZero, NSError **error);

#pragma mark - compare

/// string和double比较
/// @param d double参数
- (FBCompareResult)compareWithDouble:(double)d;

/// string和string比较
/// @param string string参数
- (FBCompareResult)compareWithString:(NSString *)string;

/// 两个浮点型比较
/// @param doubleA doubleA description
/// @param doubleB doubleB description
+ (FBCompareResult)compareDoubleA:(double)doubleA withDoubleB:(double)doubleB;

#pragma mark - adding

- (NSDecimalNumber *)byAddDouble:(double)d;

- (NSDecimalNumber *)byAddString:(NSString *)string;

- (NSDecimalNumber *)byAddDouble:(double)d error:(NSError **)error;

- (NSDecimalNumber *)byAddString:(NSString *)string error:(NSError **)error;

#pragma mark - subtracting

- (NSDecimalNumber *)bySubtractDouble:(double)d;

- (NSDecimalNumber *)bySubtractString:(NSString *)string;

- (NSDecimalNumber *)bySubtractDouble:(double)d error:(NSError **)error;

- (NSDecimalNumber *)bySubtractString:(NSString *)string error:(NSError **)error;

#pragma mark - multiplying

- (NSDecimalNumber *)byMultiplyDouble:(double)d;

- (NSDecimalNumber *)byMultiplyString:(NSString *)string;

- (NSDecimalNumber *)byMultiplyDouble:(double)d error:(NSError **)error;

- (NSDecimalNumber *)byMultiplyString:(NSString *)string error:(NSError **)error;

#pragma mark - dividing

- (NSDecimalNumber *)byDivideDouble:(double)d;

- (NSDecimalNumber *)byDivideString:(NSString *)string;

- (NSDecimalNumber *)byDivideDouble:(double)d error:(NSError **)error;

- (NSDecimalNumber *)byDivideString:(NSString *)string error:(NSError **)error;

#pragma mark - rounding

/// 进位mode
/// @param mode 进位的mode，具体参考NSRoundingMode
/// @param position 保留到小数点后几位
/// @param error error description 
- (NSDecimalNumber *)roundingMode:(NSRoundingMode)mode afterPoint:(NSInteger)position error:(NSError **)error;

/// double类型的数据类型进位
/// @param d double数据
/// @param mode 进位模式，参考NSRoundingMode
/// @param position 保留小数点后几位
/// @param error error description
+ (NSDecimalNumber *)roundingDouble:(double)d mode:(NSRoundingMode)mode afterPoint:(NSInteger)position error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
