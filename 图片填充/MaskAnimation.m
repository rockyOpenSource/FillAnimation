//
//  MaskAnimation.m
//  图片填充
//
//  Created by qishang on 16/2/23.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "MaskAnimation.h"

static CGFloat const kImageWidth = 104.0f;
static CGFloat const kImageHeight = 157.f;

@implementation MaskAnimation {

    CAShapeLayer *maskLayer ;
    UIImageView *foregroundImageView;
}


- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"group1"]];
        backgroundImageView.frame = CGRectMake(0, 0, kImageWidth, kImageHeight);
        [self addSubview:backgroundImageView];
        
        foregroundImageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"group2"]];
        foregroundImageView.frame = CGRectMake(0, 0, kImageWidth, kImageHeight);
        [self addSubview:foregroundImageView];
        
    }
    
    return self;
}



- (void)startFillAnimation {

    maskLayer = [CAShapeLayer layer];

    UIBezierPath *fromPath = [UIBezierPath bezierPathWithRect:self.bounds];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kImageWidth, 0)];
    maskLayer.path = fromPath.CGPath;
    maskLayer.speed = 1;
    [maskLayer removeAllAnimations];
    
    CABasicAnimation *basicAnimation =[CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.fromValue = (__bridge id _Nullable)(fromPath.CGPath);
    basicAnimation.toValue = toPath;
    basicAnimation.duration = 5;
    [maskLayer addAnimation:basicAnimation forKey:@"pathAnimation"];
    
    maskLayer.path = toPath.CGPath;
    foregroundImageView.layer.mask = maskLayer;

}

- (void)pasueFillAnimation {

    CFTimeInterval pausedTime = [maskLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    maskLayer.speed = 0;
    maskLayer.timeOffset = pausedTime;

}

- (void)resumeFillAnimation {

    CFTimeInterval pausedTime = maskLayer.timeOffset;
    maskLayer.speed = 1.0;
    maskLayer.timeOffset = 0;
    maskLayer.beginTime = 0;
    CFTimeInterval timeSincePause = [maskLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    maskLayer.beginTime = timeSincePause;


}

@end
