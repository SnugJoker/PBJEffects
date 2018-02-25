//
//  PBJEffects.h
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>


@interface PBJEffects : NSObject


#pragma mark - Enums


typedef NS_ENUM (NSInteger, ShadowType) {
    
    ShadowTypeMoreGentle,
    ShadowTypeLessGentle,
    ShadowTypeTrapezoidal,
    ShadowTypeEllipticalBottom,
    ShadowTypeCurlBottom,
};


#pragma mark - Static Methods
#pragma mark Shadow


+(void)addShadowToView:(UIView *)view withShadowType:(ShadowType)shadowType;
+(void)addShadowToView:(UIView *)view onSuperView:(UIView *)superView;
+(UIView *)addShadowView:(UIView *)viewShadow toView:(UIView *)view onSuperView:(UIView *)superView;


#pragma mark Fade


+(void)fadeInView:(UIView *)view;
+(void)fadeOutView:(UIView *)view;


#pragma mark Blur


+(UIView *)addBlurToView:(UIView *)view withStyle:(UIBlurEffectStyle)style;
+(UIImage *)addBlurToImage:(UIImage *)image;



@end
