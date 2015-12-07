//
//  HomePageAnimationUntil.h
//  DemoAutoLayoutAnimation
//
//  Created by 戒惜舍得 on 12/7/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

@interface HomePageAnimationUntil : NSObject

+ (void)animateWithAnimateView:(UIView *)animateView onTheMap:(UIView *)mapView;

+ (void)animateWithConstraints:(NSLayoutConstraint *)constraint constant:(CGFloat )constant onTheMap:(UIView *)mapView;

+ (void)viewMaskAnimation:(UIView *)animateView withBeginTime:(NSTimeInterval)beginTime;

@end
