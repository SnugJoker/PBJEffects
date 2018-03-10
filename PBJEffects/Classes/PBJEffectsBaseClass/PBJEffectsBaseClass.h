//
//  PBJEffectsBaseClass.h
//  LGPlusButtonsView
//
//  Created by Joseph on 09/03/2018.
//


#import <Foundation/Foundation.h>

#import "Constants.h"


@interface PBJEffectsBaseClass : NSObject
{
    
}


#pragma mark - Static Methods
#pragma mark UIImage Filters


//"Master Functions"
+(UIImage *)image:(UIImage *)image withCIFilter:(NSString *)filterName;




@end
