//
//  Enums.h
//  Pods
//
//  Created by Joseph on 11/03/2018.
//

#ifndef Enums_h
#define Enums_h

typedef NS_ENUM (NSInteger, CategoryColorEffect) {
    
    CategoryColorEffect_CIColorCrossPolynomial,
    CategoryColorEffect_CIColorCube,
    CategoryColorEffect_CIColorCubeWithColorSpace,
    CategoryColorEffect_CIColorInvert,
    CategoryColorEffect_CIColorMap,
    CategoryColorEffect_CIColorMonoChrome,
    CategoryColorEffect_CIColorPosterize,
    CategoryColorEffect_CIFalseColor,
    CategoryColorEffect_CIMaskToAlpha,
    CategoryColorEffect_CIMaximumComponent,
    CategoryColorEffect_CIMinimumComponent,
    CategoryColorEffect_CIPhotoEffectChrome,
    CategoryColorEffect_CIPhotoEffectFade,
    CategoryColorEffect_CIPhotoEffectInstant,
    CategoryColorEffect_CIPhotoEffectMono,
    CategoryColorEffect_CIPhotoEffectNoir,
    CategoryColorEffect_CIPhotoEffectProcess,
    CategoryColorEffect_CIPhotoEffectTonal,
    CategoryColorEffect_CIPhotoEffectTransfer,
    CategoryColorEffect_CISepiatone,
    CategoryColorEffect_CIVignette,
    CategoryColorEffect_CIVignetteEffect,
};

typedef NS_ENUM (NSInteger, ShadowType) {
    
    ShadowTypeMoreGentle,
    ShadowTypeLessGentle,
    ShadowTypeTrapezoidal,
    ShadowTypeEllipticalBottom,
    ShadowTypeCurlBottom,
};


#endif /* Enums_h */
