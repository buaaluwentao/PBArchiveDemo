//
//  PBPerson.h
//  PBArchiveDemo
//
//  Created by wentao lu on 2021/4/18.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

@interface PBPerson : NSObject<NSSecureCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@end

NS_ASSUME_NONNULL_END
