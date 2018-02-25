//
//  PBJEffects.m
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import "PBJImageEffects.h"


@implementation PBJImageEffects


#pragma mark - Private Methods
#pragma mark Memory


-(void)dealloc
{
    
}



#pragma mark - Static Methods
#pragma mark Image Effects


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

//"Sub Functions"
+(UIImage *)convertImageToCIColorCrossPolynomial:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorCrossPolynomial"];
}

+(UIImage *)convertImageToCIColorCube:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorCube"];
}

+(UIImage *)convertImageToCIColorCubeWithColorSpace:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorCubeWithColorSpace"];
}

+(UIImage *)convertImageToCIColorInvert:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorInvert"];
}

+(UIImage *)convertImageToCIColorMap:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorMap"];
}

+(UIImage *)convertImageToCIColorMonochrome:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorMonochrome"];
}

+(UIImage *)convertImageToCIColorPosterize:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIColorPosterize"];
}

+(UIImage *)convertImageToCIFalseColor:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIFalseColor"];
}

+(UIImage *)convertImageToCIMaskToAlpha:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIMaskToAlpha"];
}

+(UIImage *)convertImageToCIMaximumComponent:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIMaximumComponent"];
}

+(UIImage *)convertImageToCIMinimumComponent:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIMinimumComponent"];
}

+(UIImage *)convertImageToCIPhotoEffectChrome:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectChrome"];
}

+(UIImage *)convertImageToCIPhotoEffectFade:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectFade"];
}

+(UIImage *)convertImageToCIPhotoEffectInstant:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectInstant"];
}

+(UIImage *)convertImageToCIPhotoEffectMono:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectMono"];
}

+(UIImage *)convertImageToCIPhotoEffectNoir:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectNoir"];
}

+(UIImage *)convertImageToCIPhotoEffectProcess:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectProcess"];
}

+(UIImage *)convertImageToCIPhotoEffectTonal:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectTonal"];
}

+(UIImage *)convertImageToCIPhotoEffectTransfer:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIPhotoEffectTransfer"];
}

+(UIImage *)convertImageToCISepiaTone:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CISepiaTone"];
}

+(UIImage *)convertImageToCIVignette:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIVignette"];
}

+(UIImage *)convertImageToCIVignetteEffect:(UIImage *)image
{
    
    return [self image:image withCIFilter:@"CIVignetteEffect"];
}

//
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
