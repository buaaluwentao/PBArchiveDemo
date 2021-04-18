//
//  PBFamily.h
//  PBArchiveDemo
//
//  Created by wentao lu on 2021/4/18.
//

#import <Foundation/Foundation.h>
#import "PBPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface PBFamily : NSObject<NSSecureCoding>
@property (nonatomic, strong) PBPerson *lwt;
@property (nonatomic, strong) PBPerson *zql;
@end

NS_ASSUME_NONNULL_END
