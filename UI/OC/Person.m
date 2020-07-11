//
//  Person.m
//  UI
//
//  Created by xiao on 2020/7/11.
//  Copyright © 2020 xiao. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setObject:(id)object
forKeyedSubscript:(NSString *)key
{
    NSLog(@"%@",key);
    
}
@end
