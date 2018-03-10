# PBJImageFilters

## Description
PBJImageFilters is a collection of UIImage effects.

## Requirements
No requirements needed.

## How To Use
To use PBJImageFilters first import the class:

```objectivec
#import <PBJEffects/PBJImageEffects.h>
```

Then simply add one of the methods to your code:

#### Objective C ####       
       
```objectivec
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
```

## Author
Joseph Razon, razonjoe@gmail.com

(Also few parts were inspired by Michael Nachbaur https://github.com/NachoMan)

## License
PBJEffects is available under the MIT license. See the LICENSE file for more info.
