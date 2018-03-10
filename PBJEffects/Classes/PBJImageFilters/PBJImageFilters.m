//
//  PBJImageFilters.m
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import "PBJImageFilters.h"


@implementation PBJImageFilters


#pragma mark - Private Methods
#pragma mark Memory


-(void)dealloc
{
    
}



#pragma mark - Static Methods
#pragma mark Image Effects


//"Sub Functions"
+(UIImage *)convertImageToCIColorCrossPolynomial:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORCROSSPOLYNOMIAL];
}

+(UIImage *)convertImageToCIColorCube:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORCUBE];
}

+(UIImage *)convertImageToCIColorCubeWithColorSpace:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORCUBEWITHCOLORSPACE];
}

+(UIImage *)convertImageToCIColorInvert:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORINVERT];
}

+(UIImage *)convertImageToCIColorMap:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORMAP];
}

+(UIImage *)convertImageToCIColorMonochrome:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORMONOCHROME];
}

+(UIImage *)convertImageToCIColorPosterize:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CICOLORPOSTERIZE];
}

+(UIImage *)convertImageToCIFalseColor:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIFALSECOLOR];
}

+(UIImage *)convertImageToCIMaskToAlpha:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIMASKTOALPHA];
}

+(UIImage *)convertImageToCIMaximumComponent:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIMAXIMUMCOMPONENT];
}

+(UIImage *)convertImageToCIMinimumComponent:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIMINIMUMCOMPONENT];
}

+(UIImage *)convertImageToCIPhotoEffectChrome:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTCHROME];
}

+(UIImage *)convertImageToCIPhotoEffectFade:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTFADE];
}

+(UIImage *)convertImageToCIPhotoEffectInstant:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTINSTANT];
}

+(UIImage *)convertImageToCIPhotoEffectMono:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTMONO];
}

+(UIImage *)convertImageToCIPhotoEffectNoir:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTNOIR];
}

+(UIImage *)convertImageToCIPhotoEffectProcess:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTPROCESS];
}

+(UIImage *)convertImageToCIPhotoEffectTonal:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTTONAL];
}

+(UIImage *)convertImageToCIPhotoEffectTransfer:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIPHOTOEFFECTTRANSFER];
}

+(UIImage *)convertImageToCISepiaTone:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CISEPIATONE];
}

+(UIImage *)convertImageToCIVignette:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIVIGNETTE];
}

+(UIImage *)convertImageToCIVignetteEffect:(UIImage *)image
{
    
    return [self image:image withCIFilter:CIFILTER_CIVIGNETTEEFFECT];
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
