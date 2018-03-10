//
//  PBJEffectsBaseClass.m
//  LGPlusButtonsView
//
//  Created by Joseph on 09/03/2018.
//


#import "PBJEffectsBaseClass.h"


@implementation PBJEffectsBaseClass


#pragma mark - Static Methods
#pragma mark UIImage Filters


//"Master Functions"
+(UIImage *)image:(UIImage *)image withCIFilter:(NSString *)filterName
{
    CIImage *unfiltered = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:unfiltered forKey:kCIInputImageKey];
    CIImage *filtered = [filter outputImage];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimage = [context createCGImage:filtered fromRect:CGRectMake(0, 0, image.size.width*image.scale, image.size.height*image.scale)];
    
    // Do not use initWithCIImage because that renders the filter each time the image is displayed.  This causes slow scrolling in tableviews.
    UIImage *imageToReturn = [[UIImage alloc] initWithCGImage:cgimage scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(cgimage);
    
    
    return imageToReturn;
}



@end
