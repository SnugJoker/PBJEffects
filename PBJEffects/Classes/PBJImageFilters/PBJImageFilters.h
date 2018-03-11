//
//  PBJImageFilters.h
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

#import "PBJEffectsBaseClass.h"


@interface PBJImageFilters : PBJEffectsBaseClass


#pragma mark - Static Methods
#pragma mark Image Effects


//Other
+(UIImage *)convertImageToGrayScale:(UIImage *)image;
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;



@end
