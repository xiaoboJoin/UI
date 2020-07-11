//
//  IUProgressButton.h
//  UI
//
//  Created by xiao on 2020/7/11.
//  Copyright © 2020 xiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IUProgressButton : UIButton

@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,assign)BOOL hideProgress;

@end

NS_ASSUME_NONNULL_END
