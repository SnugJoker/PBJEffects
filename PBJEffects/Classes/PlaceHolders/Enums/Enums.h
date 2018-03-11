//
//  Enums.h
//  Pods
//
//  Created by Joseph on 11/03/2018.
//

#ifndef Enums_h
#define Enums_h

typedef NS_ENUM (NSInteger, CICategoryColorEffect) {
    
    CICategoryColorEffect_CIColorCrossPolynomial,
    CICategoryColorEffect_CIColorCube,
    CICategoryColorEffect_CIColorCubeWithColorSpace,
    CICategoryColorEffect_CIColorInvert,
    CICategoryColorEffect_CIColorMap,
    CICategoryColorEffect_CIColorMonoChrome,
    CICategoryColorEffect_CIColorPosterize,
    CICategoryColorEffect_CIFalseColor,
    CICategoryColorEffect_CIMaskToAlpha,
    CICategoryColorEffect_CIMaximumComponent,
    CICategoryColorEffect_CIMinimumComponent,
    CICategoryColorEffect_CIPhotoEffectChrome,
    CICategoryColorEffect_CIPhotoEffectFade,
    CICategoryColorEffect_CIPhotoEffectInstant,
    CICategoryColorEffect_CIPhotoEffectMono,
    CICategoryColorEffect_CIPhotoEffectNoir,
    CICategoryColorEffect_CIPhotoEffectProcess,
    CICategoryColorEffect_CIPhotoEffectTonal,
    CICategoryColorEffect_CIPhotoEffectTransfer,
    CICategoryColorEffect_CISepiatone,
    CICategoryColorEffect_CIVignette,
    CICategoryColorEffect_CIVignetteEffect,
};

typedef NS_ENUM (NSInteger, ShadowType) {
    
    ShadowTypeMoreGentle,
    ShadowTypeLessGentle,
    ShadowTypeTrapezoidal,
    ShadowTypeEllipticalBottom,
    ShadowTypeCurlBottom,
};


#endif /* Enums_h */
