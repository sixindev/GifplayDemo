//
//  UIImageView+Animation.m
//  MobileSiBu
//
//  Created by luo.h on 15-4-27.
//  Copyright (c) 2015年 sibu.cn. All rights reserved.
//

#import "UIImageView+Animation.h"

@implementation UIImageView (Animation)

+(id)imageViewAnimation:(CGRect)frame imageNames:(NSArray *)imageNames duration:(CGFloat)duration
{
    
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:imageNames.count];
    for (NSInteger index = 0; index < imageNames.count; index++)
    {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:index]]];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.animationImages = images;
    imageView.animationDuration = duration;
    return imageView;
}

@end
