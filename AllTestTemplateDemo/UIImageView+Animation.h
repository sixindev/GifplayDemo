//
//  UIImageView+Animation.h
//  MobileSiBu
//
//  Created by luo.h on 15-4-27.
//  Copyright (c) 2015年 sibu.cn. All rights reserved.
//
/**
 *  imageview 动画
 *
 */

#import <UIKit/UIKit.h>

@interface UIImageView (Animation)


+(id)imageViewAnimation:(CGRect)frame imageNames:(NSArray *)imageNames duration:(CGFloat)duration;

@end
