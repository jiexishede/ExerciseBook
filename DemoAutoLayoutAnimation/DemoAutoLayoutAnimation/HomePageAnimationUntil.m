//
//  HomePageAnimationUntil.m
//  DemoAutoLayoutAnimation
//
//  Created by 戒惜舍得 on 12/7/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import "HomePageAnimationUntil.h"

@implementation HomePageAnimationUntil

+ (void)animateWithAnimateView:(UIView *)animateView onTheMap:(UIView *)mapView{
    
   [UIView animateWithDuration:1.5 animations:^{
       animateView.transform = CGAffineTransformIdentity;
   }];
}

+ (void)animateWithConstraints:(NSLayoutConstraint *)constraint constant:(CGFloat)constant onTheMap:(UIView *)mapView{
    
    constraint.constant = constant;
    [UIView  animateWithDuration:1.5 animations:^{
        [mapView layoutIfNeeded];
    }];
}

+ (void)viewMaskAnimation:(UIView *)animateView withBeginTime:(NSTimeInterval)beginTime{
    
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(animateView.bounds))].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(animateView.bounds), CGRectGetHeight(animateView.bounds))].CGPath;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    animateView.layer.mask = layer;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (id)layer.path;
    animation.toValue = (__bridge id)endPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];

}

+ (void)registerButtonWidthAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress
{
    static CAShapeLayer *layer = nil;
    if (!button.layer.mask) {
        layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds) * progress, CGRectGetHeight(button.bounds))].CGPath;
        layer.fillColor = [UIColor whiteColor].CGColor;
        button.layer.mask = layer;
    }else
    {
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds) * progress, CGRectGetHeight(button.bounds))].CGPath;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.duration = 0.25;
        animation.fromValue = (id)layer.path;
        animation.toValue = (__bridge id)path;
        animation.removedOnCompletion = YES;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
        layer.path = path;
    }
    
}


@end
