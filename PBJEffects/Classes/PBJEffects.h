//
//  PBJEffects.h
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>


@interface PBJEffects : NSObject


#pragma mark - Static Methods
#pragma mark Shadow


+(void)addShadowToView:(UIView *)view;
+(void)addShadowToView:(UIView *)view onSuperView:(UIView *)superView;
+(UIView *)addShadowView:(UIView *)viewShadow toView:(UIView *)view onSuperView:(UIView *)superView;


#pragma mark Fade


+(void)fadeInView:(UIView *)view;
+(void)fadeOutView:(UIView *)view;


#pragma mark Blur


+(UIView *)addBlurToView:(UIView *)view withStyle:(UIBlurEffectStyle)style;
+(UIImage *)addBlurToImage:(UIImage *)image;


#pragma mark Image Filters


+(UIImage *)convertImageToMonoEffect:(UIImage *)image;
+(UIImage *)convertImageToNoirEffect:(UIImage *)image;
+(UIImage *)image:(UIImage *)image withCIFilter:(NSString *)filterName;
+(UIImage *)convertImageToGrayScale:(UIImage *)image;
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;



@end

