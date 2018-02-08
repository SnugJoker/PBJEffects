# PBJEffects

[![CI Status](http://img.shields.io/travis/josephrazon/PBJEffects.svg?style=flat)](https://travis-ci.org/josephrazon/PBJEffects)
[![Version](https://img.shields.io/cocoapods/v/PBJEffects.svg?style=flat)](http://cocoapods.org/pods/PBJEffects)
[![License](https://img.shields.io/cocoapods/l/PBJEffects.svg?style=flat)](http://cocoapods.org/pods/PBJEffects)
[![Platform](https://img.shields.io/cocoapods/p/PBJEffects.svg?style=flat)](http://cocoapods.org/pods/PBJEffects)

## Description
PBJAnimations is a nice collection of cool animations & transitions.

## Requirements
No requirements needed.

## Installation
PBJEffects is available through [CocoaPods](http://cocoapods.org). 
To install it, simply add the following line to your Podfile:

```ruby
pod 'PBJEffects'
```

## How To Use
To use PBJAnimations first import the class:

```objectivec
#import "PBJAnimations.h"
```

Then simply add one of the methods to your code:

#### Objective C ####       
* Shadow
   
```objectivec
+(void)addShadowToView:(UIView *)view;
+(void)addShadowToView:(UIView *)view onSuperView:(UIView *)superView;
+(UIView *)addShadowView:(UIView *)viewShadow toView:(UIView *)view onSuperView:(UIView *)superView;
```

* Fade
    
```objectivec
+(void)fadeInView:(UIView *)view;
+(void)fadeOutView:(UIView *)view;
```
    
* Blur
       
```objectivec
+(UIView *)addBlurToView:(UIView *)view;
+(UIImage *)addBlurToImage:(UIImage *)image;
```

* Image Filters
       
```objectivec
+(UIImage *)convertImageToMonoEffect:(UIImage *)image;
+(UIImage *)convertImageToNoirEffect:(UIImage *)image;
+(UIImage *)image:(UIImage *)image withCIFilter:(NSString *)filterName;
+(UIImage *)convertImageToGrayScale:(UIImage *)image;
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;
```

## Author
Joseph Razon, razonjoe@gmail.com

## License
PBJEffects is available under the MIT license. See the LICENSE file for more info.
