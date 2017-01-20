//
//  NSNumber+Calculate.h
//  NumberExtension
//
//  Created by Broccoli on 2017/1/19.
//  Copyright © 2017年 broccoliii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Calculate)


#pragma mark - Initializers
/**
 Initialize with Integer value
 
 @param numberValue Integer number
 @return NSDecimalNumber
 */
+ (NSDecimalNumber *)decimalNumberWithInteger:(NSInteger)numberValue;

/**
 Initialize with NSNumber value
 
 @param numberValue NSNumber number
 @return NSDecimalNumber
 */
+ (NSDecimalNumber *)decimalNumberWithNumber:(NSNumber *)numberValue;

#pragma mark - Basic operation
/**
 adding
 */
- (NSDecimalNumber *(^)(NSInteger))adding;

/**
 subtracting
 */
- (NSDecimalNumber *(^)(NSInteger))subtracting;

/**
 multiplyingBy
 */
- (NSDecimalNumber *(^)(NSInteger))multiplyingBy;

/**
 dividingBy
 */
- (NSDecimalNumber *(^)(NSInteger))dividingBy;

#pragma mark - round
/**
 round precision
 */
- (NSDecimalNumber *(^)(NSInteger))roundScale;

/**
 round precision 0 抹角 1 抹分
 */
- (NSDecimalNumber *(^)(NSInteger))generousScale;

/**
 greedy round
 */
- (NSDecimalNumber *(^)(NSInteger))greedyScale;

@end
