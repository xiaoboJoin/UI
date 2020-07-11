//
//  Person.h
//  UI
//
//  Created by xiao on 2020/7/11.
//  Copyright © 2020 xiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)setObject:(id)object
forKeyedSubscript:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
