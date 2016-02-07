//
//  UIFont+UCFonts.m
//  Uberchord
//
//  Created by Rafal Augustyniak on 10.10.2014.
//  Copyright (c) 2014 Uberchord Engineering. All rights reserved.
//

#import "UIFont+UCFonts.h"
#import <CoreText/CoreText.h>


NSString *const UCHelveticaNeueFontName = @"HelveticaNeue";
NSString *const UCHelveticaNeueBoldFontName = @"HelveticaNeue-Bold";
NSString *const UCHelveticaNeueMediumFontName = @"HelveticaNeue-Medium";
NSString *const UCHelveticaNeueThinFontName = @"HelveticaNeue-Thin";
NSString *const UCHelveticaNeueLightFontName = @"HelveticaNeue-Light";
NSString *const UCHelveticaNeueUltraLightFontName = @"HelveticaNeue-UltraLight";
NSString *const UCMusicSyncFontName = @"MusiSync";
NSString *const UCAwesomeFontName = @"FontAwesome";
NSString *const UCUberchordFontName = @"Uberchord_web";

@implementation UIFont (UCFonts)

+ (UIFont *)uc_helveticaNeueWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCHelveticaNeueFontName size:size];
}

+ (UIFont *)uc_helveticaNeueBoldFontWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCHelveticaNeueBoldFontName size:size];
}

+ (UIFont *)uc_helveticaNeueMediumFontWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCHelveticaNeueMediumFontName size:size];
}

+ (UIFont *)uc_helveticaNeueThinFontWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCHelveticaNeueThinFontName size:size];
}

+ (UIFont *)uc_helveticaNeueLightWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCHelveticaNeueLightFontName size:size];
}

+ (UIFont *)uc_helveticaNeueUltraLightWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCHelveticaNeueUltraLightFontName size:size];
}

+ (UIFont *)uc_musicFontWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCMusicSyncFontName size:size];
}

+ (UIFont *)uc_uberchordFontWithSize:(CGFloat)size
{
  UIFont *font = [UIFont fontWithName:UCUberchordFontName size:size];
  if (!font) {
    CFErrorRef error;
    NSURL *url = [[NSBundle mainBundle] URLForResource:UCUberchordFontName withExtension:@"ttf"];
    NSURL *fontURL = [self URLForUberchordFontName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[fontURL path]]) {
      url = fontURL;
    }
    if(!CTFontManagerRegisterFontsForURL((__bridge CFURLRef)url, kCTFontManagerScopeProcess, &error)) {
      return nil;
    }
    
    return [UIFont uc_uberchordFontWithSize:size];
  }
  return font;
}

+ (UIFont *)uc_awesomeFontWithSize:(CGFloat)size
{
  return [UIFont fontWithName:UCAwesomeFontName size:size];
}

+ (NSURL *)URLForUberchordFontName
{
  NSString* cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
  NSURL *url = [NSURL fileURLWithPath:cachesPath];
  url = [url URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.ttf", UCUberchordFontName]];
  return url;
}

+ (void)replaceUberchordFontWithData:(NSData *)data
{
  if (!data) {
    return;
  }
  
  CFErrorRef error;
  NSURL *fontURL = [self URLForUberchordFontName];
  
  // We have a cached version, unregister it
  if ([[NSFileManager defaultManager] fileExistsAtPath:[fontURL path]]) {
    if (!CTFontManagerUnregisterFontsForURL((__bridge CFURLRef)fontURL, kCTFontManagerScopeProcess, &error)) {
      CFStringRef errorDescription = CFErrorCopyDescription(error);
      CFRelease(errorDescription);
    } else {
      [[NSFileManager defaultManager] removeItemAtURL:fontURL error:nil];
    }
  } else {
    // Unregister the bundle verison
    NSURL *fontBundleURL = [[NSBundle mainBundle] URLForResource:UCUberchordFontName withExtension:@"ttf"];
    if (!CTFontManagerUnregisterFontsForURL((__bridge CFURLRef)fontBundleURL, kCTFontManagerScopeProcess, &error)) {
      CFStringRef errorDescription = CFErrorCopyDescription(error);
      CFRelease(errorDescription);
    }
  }
  // Update the contents of the file
  [[NSFileManager defaultManager] createFileAtPath:[fontURL path] contents:data attributes:nil];
  // Register the newly downloaded font
  if (!CTFontManagerRegisterFontsForURL((__bridge CFURLRef)fontURL, kCTFontManagerScopeProcess, &error)) {
    CFStringRef errorDescription = CFErrorCopyDescription(error);
    CFRelease(errorDescription);
  }
}

@end
