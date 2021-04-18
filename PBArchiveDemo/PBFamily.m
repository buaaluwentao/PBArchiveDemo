//
//  PBFamily.m
//  PBArchiveDemo
//
//  Created by wentao lu on 2021/4/18.
//

#import "PBFamily.h"

@implementation PBFamily
- (void)encodeWithCoder:(NSCoder *)coder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(PBFamily.class, &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *ivarName = ivar_getName(ivars[i]);
        NSString *ivarNameStr = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
        id v = [self valueForKey:ivarNameStr];
        [coder encodeObject:v forKey:ivarNameStr];
    }
    
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(PBFamily.class, &count);
        for (unsigned int i = 0; i < count; i++) {
            const char *ivarName = ivar_getName(ivars[i]);
            NSString *ivarNameStr = [NSString stringWithCString:ivarName encoding:NSUTF8StringEncoding];
            id v = [coder decodeObjectForKey:ivarNameStr];
            [self setValue:v forKey:ivarNameStr];
        }
        
        free(ivars);
    }
    return self;
}

+(BOOL)supportsSecureCoding{
    return YES;
}
@end
