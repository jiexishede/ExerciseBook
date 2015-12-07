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

@end
