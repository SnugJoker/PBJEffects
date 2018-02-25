//
//  PBJImageEffects.h
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>


@interface PBJImageEffects : NSObject


#pragma mark - Static Methods
#pragma mark Image Effects


//"Sub Functions"
+(UIImage *)convertImageToCIColorCrossPolynomial:(UIImage *)image;
+(UIImage *)convertImageToCIColorCube:(UIImage *)image;
+(UIImage *)convertImageToCIColorCubeWithColorSpace:(UIImage *)image;
+(UIImage *)convertImageToCIColorInvert:(UIImage *)image;
+(UIImage *)convertImageToCIColorMap:(UIImage *)image;
+(UIImage *)convertImageToCIColorMonochrome:(UIImage *)image;
+(UIImage *)convertImageToCIColorPosterize:(UIImage *)image;
+(UIImage *)convertImageToCIFalseColor:(UIImage *)image;
+(UIImage *)convertImageToCIMaskToAlpha:(UIImage *)image;
+(UIImage *)convertImageToCIMaximumComponent:(UIImage *)image;
+(UIImage *)convertImageToCIMinimumComponent:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectChrome:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectFade:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectInstant:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectMono:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectNoir:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectProcess:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectTonal:(UIImage *)image;
+(UIImage *)convertImageToCIPhotoEffectTransfer:(UIImage *)image;
+(UIImage *)convertImageToCISepiaTone:(UIImage *)image;
+(UIImage *)convertImageToCIVignette:(UIImage *)image;
+(UIImage *)convertImageToCIVignetteEffect:(UIImage *)image;
//Other
+(UIImage *)convertImageToGrayScale:(UIImage *)image;
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;


@end

