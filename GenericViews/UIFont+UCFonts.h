//
//  UIFont+UCFonts.h
//  Uberchord
//
//  Created by Rafal Augustyniak on 10.10.2014.
//  Copyright (c) 2014 Uberchord Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const UCHelveticaNeueFontName;
extern NSString *const UCHelveticaNeueMediumFontName;
extern NSString *const UCHelveticaNeueThinFontName;
extern NSString *const UCHelveticaNeueLightFontName;
extern NSString *const UCHelveticaNeueUltraLightFontName;
extern NSString *const UCMusicSyncFontName;
extern NSString *const UCUberchordFontName;

@interface UIFont (UCFonts)
+ (UIFont *)uc_helveticaNeueWithSize:(CGFloat)size;
+ (UIFont *)uc_helveticaNeueBoldFontWithSize:(CGFloat)size;
+ (UIFont *)uc_helveticaNeueMediumFontWithSize:(CGFloat)size;
+ (UIFont *)uc_helveticaNeueThinFontWithSize:(CGFloat)size;
+ (UIFont *)uc_helveticaNeueLightWithSize:(CGFloat)size;
+ (UIFont *)uc_helveticaNeueUltraLightWithSize:(CGFloat)size;
+ (UIFont *)uc_musicFontWithSize:(CGFloat)size;
+ (UIFont *)uc_uberchordFontWithSize:(CGFloat)size;
+ (UIFont *)uc_awesomeFontWithSize:(CGFloat)size;

// Replace the font with the newly downloaded one
+ (void)replaceUberchordFontWithData:(NSData *)data;

@end
