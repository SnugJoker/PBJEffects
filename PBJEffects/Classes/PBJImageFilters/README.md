# PBJImageFilters

## Description
PBJImageFilters is a collection of UIImage effects.

## Requirements
No requirements needed.

## How To Use
To use PBJImageFilters first import the class:

```objectivec

#import <PBJEffects/PBJImageFilters.h>
```

Then simply add thie maser function to your code:

#### Objective C ####       
       
```objectivec

+(UIImage *)image:(UIImage *)image withCategoryColorEffect:(CategoryColorEffect)categoryColorEffect;
```

### Implementation
image (UIImage *): The UIImage object for aplying the filter.

categoryColorEffect (CategoryColorEffect): One of the image filter enum:

+ **CategoryColorEffect_CIColorCrossPolynomial**
+ **CategoryColorEffect_CIColorCube**
+ **CategoryColorEffect_CIColorCubeWithColorSpace**
+ **CategoryColorEffect_CIColorInvert**
+ **CategoryColorEffect_CIColorMap**
+ **CategoryColorEffect_CIColorMonoChrome**
+ **CategoryColorEffect_CIColorPosterize**
+ **CategoryColorEffect_CIFalseColor**
+ **CategoryColorEffect_CIMaskToAlpha**
+ **CategoryColorEffect_CIMaximumComponent**
+ **CategoryColorEffect_CIMinimumComponent**
+ **CategoryColorEffect_CIPhotoEffectChrome**
+ **CategoryColorEffect_CIPhotoEffectFade**
+ **CategoryColorEffect_CIPhotoEffectInstant**
+ **CategoryColorEffect_CIPhotoEffectMono**
+ **CategoryColorEffect_CIPhotoEffectNoir**
+ **CategoryColorEffect_CIPhotoEffectProcess**
+ **CategoryColorEffect_CIPhotoEffectTonal**
+ **CategoryColorEffect_CIPhotoEffectTransfer**
+ **CategoryColorEffect_CISepiatone**
+ **CategoryColorEffect_CIVignette**
+ **CategoryColorEffect_CIVignetteEffect**

## Author
Joseph Razon, razonjoe@gmail.com

(Also few parts were inspired by Michael Nachbaur https://github.com/NachoMan)

## License
PBJEffects is available under the MIT license. See the LICENSE file for more info.
