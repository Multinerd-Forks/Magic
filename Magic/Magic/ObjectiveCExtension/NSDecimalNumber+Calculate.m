//
//  NSNumber+Calculate.m
//  NumberExtension
//
//  Created by Broccoli on 2017/1/19.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import "NSDecimalNumber+Calculate.h"

@implementation NSDecimalNumber (Calculate)

#pragma mark - Initializers
/**
 Initialize with Integer value

 @param numberValue Integer number
 @return NSDecimalNumber
 */
+ (NSDecimalNumber *)decimalNumberWithInteger:(NSInteger)numberValue {
    return [NSDecimalNumber decimalNumberWithDecimal:[@(numberValue) decimalValue]];
}

/**
 Initialize with NSNumber value
 
 @param numberValue NSNumber number
 @return NSDecimalNumber
 */
+ (NSDecimalNumber *)decimalNumberWithNumber:(NSNumber *)numberValue {
    return [NSDecimalNumber decimalNumberWithDecimal:[numberValue decimalValue]];
}

#pragma mark - Basic operation
/**
 adding
 */
- (NSDecimalNumber *(^)(NSInteger))adding {
    return ^id(NSInteger attribute) {
        return [self decimalNumberByAdding:[NSDecimalNumber decimalNumberWithInteger:attribute]];
    };
}

/**
 subtracting
 */
- (NSDecimalNumber *(^)(NSInteger))subtracting {
    return ^id(NSInteger attribute) {
        return [self decimalNumberBySubtracting:[NSDecimalNumber decimalNumberWithInteger:attribute]];
    };
}

/**
 multiplyingBy
 */
- (NSDecimalNumber *(^)(NSInteger))multiplyingBy {
    return ^id(NSInteger attribute) {
        return [self decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithInteger:attribute]];
    };
}

/**
 dividingBy
 */
- (NSDecimalNumber *(^)(NSInteger))dividingBy {
    return ^id(NSInteger attribute) {
        return [self decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithInteger:attribute]];
    };
}

#pragma mark - round
/**
 round precision
 */
- (NSDecimalNumber *(^)(NSInteger))roundScale {
    return ^id(NSInteger attribute) {
        return [self roundToScale:attribute mode:NSRoundPlain];
    };
}

/**
 round precision 0 抹角 1 抹分
 */
- (NSDecimalNumber *(^)(NSInteger))generousScale {
    return ^id(NSInteger attribute) {
        return [self roundToScale:attribute mode:NSRoundDown];
    };
}

/**
 greedy round
 */
- (NSDecimalNumber *(^)(NSInteger))greedyScale {
    return ^id(NSInteger attribute) {
        return [self roundToScale:attribute mode:NSRoundUp];
    };
}

#pragma mark - private
- (NSDecimalNumber *)roundToScale:(short)scale mode:(NSRoundingMode)roundingMode {
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode
                                                                                             scale:scale
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:YES
                                                                                  raiseOnUnderflow:YES
                                                                               raiseOnDivideByZero:YES];
    return [self decimalNumberByRoundingAccordingToBehavior:handler];
}

@end
