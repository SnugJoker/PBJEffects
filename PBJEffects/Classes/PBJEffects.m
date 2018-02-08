//
//  PBJEffects.m
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import "PBJEffects.h"


@implementation PBJEffects
{
    
}


#pragma mark - Private Methods
#pragma mark Memory


-(void)dealloc
{
    
}


#pragma mark - Static Methods
#pragma mark Shadow


+(void)addShadowToView:(UIView *)view
{
    [view.layer setMasksToBounds:NO];
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOffset:CGSizeMake(0, 1.5)];
    [view.layer setShadowRadius:4.50];
    [view.layer setShadowOpacity:0.50];
}

+(void)addShadowToView:(UIView *)view onSuperView:(UIView *)superView
{
    UIView *viewShadow = [[UIView alloc] initWithFrame:view.frame];
    [viewShadow setBackgroundColor:[UIColor whiteColor]];
    [viewShadow.layer setMasksToBounds:NO];
    [viewShadow.layer setShadowColor:[UIColor blackColor].CGColor];
    [viewShadow.layer setShadowOffset:CGSizeMake(0, 1.5)];
    [viewShadow.layer setShadowRadius:4.50];
    [viewShadow.layer setShadowOpacity:0.50];
    
    [superView insertSubview:viewShadow belowSubview:view];
}

+(UIView *)addShadowView:(UIView *)viewShadow toView:(UIView *)view onSuperView:(UIView *)superView
{
    viewShadow = [[UIView alloc] initWithFrame:view.frame];
    [viewShadow setBackgroundColor:[UIColor whiteColor]];
    [viewShadow.layer setMasksToBounds:NO];
    [viewShadow.layer setShadowColor:[UIColor blackColor].CGColor];
    [viewShadow.layer setShadowOffset:CGSizeMake(0, 2.0)];
    [viewShadow.layer setShadowRadius:4.50];
    [viewShadow.layer setShadowOpacity:0.650];
    
    [superView insertSubview:viewShadow belowSubview:view];
    
    //
    return viewShadow;
}


#pragma mark Fade


+(void)fadeInView:(UIView *)view
{
    [UIView animateWithDuration:0.333 animations:^(){
        
        [view setAlpha:1.0];
    }];
}

+(void)fadeOutView:(UIView *)view
{
    [UIView animateWithDuration:0.333 animations:^(){
        
        [view setAlpha:0];
    }];
}


#pragma mark Blur


+(UIView *)addBlurToView:(UIView *)view
{
    //Get a UIImage from the UIView
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Blur the UIImage with a CIFilter
    CIImage *imageToBlur = [CIImage imageWithCGImage:viewImage.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 10] forKey: @"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    UIImage *endImage = [[UIImage alloc] initWithCIImage:resultImage];
    
    //Place the UIImage in a UIImageView
    UIImageView *newView = [[UIImageView alloc] initWithFrame:view.bounds];
    newView.image = endImage;
    //    [view.superview addSubview:newView];
    [view.superview insertSubview:newView aboveSubview:view];
    
    return newView;
}

+(UIImage *)addBlurToImage:(UIImage *)image
{
    //create our blurred image
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    //setting up Gaussian Blur (we could use one of many filters offered by Core Image)
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:1.00f] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    //CIGaussianBlur has a tendency to shrink the image a little,
    //this ensures it matches up exactly to the bounds of our original image
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    //Creates an UIImage object with the blur effect.
    UIImage *bluredImage = [UIImage imageWithCGImage:cgImage];
    
    //Releases the CGImage object.
    CGImageRelease(cgImage);
    
    //Returns the blured image.
    return bluredImage;
    
    //if you need scaling
    //return [[self class] scaleIfNeeded:cgImage];
}

+(UIImage *)scaleIfNeeded:(CGImageRef)cgimg
{
    bool isRetina = [[[UIDevice currentDevice] systemVersion] intValue] >= 4 &&
    [[UIScreen mainScreen] scale] == 2.0;
    
    if (isRetina) {
        
        return [UIImage imageWithCGImage:cgimg scale:2.0 orientation:UIImageOrientationUp];
        
    }else {
        
        return [UIImage imageWithCGImage:cgimg];
    }
}


#pragma mark ImageView Filters


+(UIImage *)convertImageToMonoEffect:(UIImage *)image
{
 
    return [self image:image withCIFilter:@"CIPhotoEffectMono"];
}

+(UIImage *)convertImageToNoirEffect:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectNoir"];
}

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

+(UIImage *)convertImageToGrayScale:(UIImage *)image
{
    //Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    //Grayscale color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    //Create bitmap content with current image size and grayscale colorspace
    CGContextRef context = CGBitmapContextCreate(nil, image.size.width, image.size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    
    //Draw image into current context, with specified rectangle
    //using previously defined context (with grayscale colorspace)
    CGContextDrawImage(context, imageRect, [image CGImage]);
    
    //Create bitmap image info from pixel data in current context
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    //Create a new UIImage object
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    
    //Release colorspace, context and bitmap information
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    
    //Return the new grayscale image
    return newImage;
}

+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -area.size.height);
    
    CGContextSaveGState(context);
    CGContextClipToMask(context, area, image.CGImage);
    
    [color set];
    CGContextFillRect(context, area);
    
    CGContextRestoreGState(context);
    
    CGContextSetBlendMode(context, kCGBlendModeMultiply);
    
    CGContextDrawImage(context, area, image.CGImage);
    
    UIImage *colorizedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return colorizedImage;
}



@end
