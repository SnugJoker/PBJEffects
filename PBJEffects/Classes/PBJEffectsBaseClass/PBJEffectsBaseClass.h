//
//  PBJEffectsBaseClass.h
//  LGPlusButtonsView
//
//  Created by Joseph on 09/03/2018.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

#import "Constants.h"
#import "Enums.h"


@interface PBJEffectsBaseClass : NSObject
{
    
}


#pragma mark - Static Methods
#pragma mark UIImage Filters


//Master Functions
+(UIImage *)image:(UIImage *)image withCategoryColorEffect:(CategoryColorEffect)categoryColorEffect;
+(UIImage *)image:(UIImage *)image withCICategoryBlur:(NSString *)filterName andWithInputLevels:(float)inputLevels;



@end
