//
//  PBJEffects.m
//  Joseph Razon (razonjoe@gmail.com)
//
//  Created by Joseph Razon (razonjoe@gmail.com) on 7/6/15.
//  Copyright (c) 2015 PBJ. All rights reserved.
//


#import "PBJEffects.h"


@implementation PBJEffects


#pragma mark - Private Methods
#pragma mark Memory


-(void)dealloc
{
    
}


#pragma mark - Static Methods
#pragma mark Shadow


+(void)addShadowToView:(UIView *)view withShadowType:(ShadowType)shadowType
{
    switch (shadowType) {
        
        case ShadowTypeMoreGentle:
        {
            [self addShadowToView:view];
        }
            break;
            
        case ShadowTypeLessGentle:
        {
            [self addMoreGentleShadowToView:view];
        }
            break;
            
        case ShadowTypeTrapezoidal:
        {
            [self addTrapezoidalShadowToView:view];
        }
            break;
            
        case ShadowTypeEllipticalBottom:
        {
            [self addEllipticalBottomShadowToView:view];
        }
            break;
            
        case ShadowTypeCurlBottom:
        {
            [self addShadowTypeCurlBottomShadowToView:view];
        }
            break;
            
        default:
            break;
    }
}

+(void)addMoreGentleShadowToView:(UIView *)view
{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.shadowPath = path.CGPath;
}

+(void)addTrapezoidalShadowToView:(UIView *)view
{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    
    CGSize size = view.bounds.size;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(size.width * 0.33f, size.height * 0.66f)];
    [path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
    [path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
    [path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
    view.layer.shadowPath = path.CGPath;
}

+(void)addEllipticalBottomShadowToView:(UIView *)view
{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    
    CGSize size = view.bounds.size;
    CGRect ovalRect = CGRectMake(0.0f, size.height + 5, size.width - 10, 15);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ovalRect];
    view.layer.shadowPath = path.CGPath;
}

+(void)addShadowTypeCurlBottomShadowToView:(UIView *)view
{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    
    CGSize size = view.bounds.size;
    CGFloat curlFactor = 15.0f;
    CGFloat shadowDepth = 5.0f;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0f, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
    [path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth)
            controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor)
            controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
}

+(void)addShadowToView:(UIView *)view
{
    [view.layer setMasksToBounds:NO];
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOffset:CGSizeMake(0, 1.5)];
    [view.layer setShadowRadius:4.50];
    [view.layer setShadowOpacity:0.650];
}

+(void)addShadowToView:(UIView *)view onSuperView:(UIView *)superView
{
    UIView *viewShadow = [[UIView alloc] initWithFrame:view.frame];
    [viewShadow setBackgroundColor:[UIColor whiteColor]];
    [viewShadow.layer setMasksToBounds:NO];
    [viewShadow.layer setShadowColor:[UIColor blackColor].CGColor];
    [viewShadow.layer setShadowOffset:CGSizeMake(0, 1.5)];
    [viewShadow.layer setShadowRadius:4.50];
    [viewShadow.layer setShadowOpacity:0.650];
    
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


+(UIView *)addBlurToView:(UIView *)view withStyle:(UIBlurEffectStyle)style
{
    if (!UIAccessibilityIsReduceTransparencyEnabled()) {
        
        view.backgroundColor = [UIColor clearColor];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = view.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [view.superview insertSubview:blurEffectView aboveSubview:view];
        
        return blurEffectView;
    }
    
    return view;
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


#pragma mark - Static (hidden) Methods




@end
