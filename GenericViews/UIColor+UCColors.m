//
//  UIColor+UberchordColors.m
//  Uberchord
//
//  Created by Rafał on 08.10.2014.
//  Copyright (c) 2014 Uberchord Engineering. All rights reserved.
//

#import "UIColor+UCColors.h"

@implementation UIColor (UCColors)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
  return [self colorFromHexString:hexString alpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha {
  unsigned rgbValue = 0;
  NSScanner *scanner = [NSScanner scannerWithString:hexString];

  if ([hexString hasPrefix:@"#"]) {
    [scanner setScanLocation:1]; // bypass '#' character
  }

  [scanner scanHexInt:&rgbValue];
  return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha];
}

+ (UIColor *)uc_darkGrayBlue
{
  return [UIColor colorFromHexString:@"34373D"];
}

+ (UIColor *)uc_darkGrayBlueBackground
{
  return [UIColor colorFromHexString:@"292A30"];
}

+ (UIColor *)uc_darkBlueBackground
{
  return [UIColor colorFromHexString:@"242E3A"];
}

+ (UIColor *)uc_keyboardBackground
{
  return [UIColor colorFromHexString:@"1C242D"];
}

+ (UIColor *)uc_statisticsBlueColor
{
	return [UIColor colorFromHexString:@"4F8DA4"];
}

+ (UIColor *)uc_statisticsGreenColor
{
	return [UIColor uc_green];
}

+ (UIColor *)uc_statisticsGreyColor
{
  return [[UIColor uc_hexEEEEEEColor] colorWithAlphaComponent:0.7];
}

+ (UIColor *)uc_statisticsLineGreyColor
{
	return [UIColor colorFromHexString:@"5E6D7E"];
}

+ (UIColor *)uc_grayColor
{
  return [UIColor colorWithWhite:0.404 alpha:1.0];
}

+ (UIColor *)uc_mediumGray
{
  return [UIColor colorWithWhite:0.56 alpha:1.0];
}

+ (UIColor *)uc_lightGray
{
  return [UIColor colorFromHexString:@"BABABA"];
}

+ (UIColor *)uc_lightGrayBlue
{
  return [UIColor colorFromHexString:@"708293"];
}

+ (UIColor *)uc_darkBlue
{
  return [UIColor colorFromHexString:@"5E6D7E"];
}

+ (UIColor *)uc_darkBlackColor
{
  return [UIColor colorFromHexString:@"262D35"];
}

+ (UIColor *)uc_darkBlueBackgroundElementColor
{
  return [UIColor colorFromHexString:@"2B3847"];
}

+ (UIColor *)uc_orange
{
  return [UIColor colorFromHexString:@"FF8321"];
}

+ (UIColor *)uc_red
{
  return [UIColor colorFromHexString:@"E52B19"];
}

+ (UIColor *)uc_green
{
  return [UIColor colorFromHexString:@"27A59A"];
}

+ (UIColor *)uc_darkOrange
{
  return [UIColor colorFromHexString:@"FF8200"];
}

+ (UIColor *)uc_lightBlueGreen
{
  return [UIColor colorFromHexString:@"2891A3"];
}

+ (UIColor *)uc_pullToRevealLightGray
{
  return [UIColor colorFromHexString:@"C9C9CA"];
}

+ (UIColor *)uc_pullToRevealDarkGray
{
  return [UIColor colorFromHexString:@"A8A8B7"];
}

+ (UIColor *)uc_normalChordColor
{
  return [self uc_orange];
}

+ (UIColor *)uc_correctChordColor
{
  return [UIColor colorFromHexString:@"2991A1"];
}

+ (UIColor *)uc_wrongChordColor
{
  return [UIColor colorFromHexString:@"F22629"];
}

+ (UIColor *)uc_darkGray
{
  return [UIColor colorFromHexString:@"4F5C69"];
}

+ (UIColor *)uc_exerciseColor
{
  return [UIColor colorFromHexString:@"5E6D7E"];
}

+ (UIColor *)uc_lpDotInactiveColor
{
  return [UIColor colorFromHexString:@"5E6D7E"];
}

+ (UIColor *)uc_lpDotOnColor
{
  return [UIColor colorFromHexString:@"D0331F"];
}

+ (UIColor *)uc_lpDotOffColor
{
  return [UIColor colorFromHexString:@"664533"];
}

+ (UIColor *)uc_learningPathsActiveExerciseColor
{
  return [UIColor colorFromHexString:@"FF6117"];
}

+ (UIColor *)uc_learningPathsInactiveExerciseColor
{
  return [UIColor colorFromHexString:@"5E6D7E"];
}

#pragma mark - NeedleView

+ (UIColor *)uc_needleViewWrongState
{
  return [UIColor uc_red];
}

+ (UIColor *)uc_needleViewCorrectState
{
  return [UIColor colorFromHexString:@"00E773"];
}

#pragma mark - Select tuning

+ (UIColor *)uc_selectedTuningColor
{
  return [UIColor uc_orange];
}

+ (UIColor *)uc_unavailableTuningColor
{
  return [UIColor colorFromHexString:@"2B3847"];
}

+ (UIColor *)uc_tuningColor
{
  return [UIColor colorFromHexString:@"44576C"];
}

+ (UIColor *)uc_tuningSuccessColor
{
  return [UIColor colorFromHexString:@"1BA59A"];
}

#pragma mark - Meter bar colors

+ (NSArray<UIColor *> *)uc_meterBarColors
{
  return @[[UIColor colorFromHexString:@"E52B19"],
           [UIColor colorFromHexString:@"FF8321"],
           [UIColor colorFromHexString:@"27A59A"],
           [UIColor colorFromHexString:@"27A59A"],
           [UIColor colorFromHexString:@"E52B19"]];
}

+ (NSArray<NSNumber *> *)uc_meterBarLocations
{
  return @[@(0.0),
           @(0.3),
           @(0.6),
           @(1.0)];
}

+ (UIColor *)uc_meterBarBackgroundColor
{
  	return [UIColor colorFromHexString:@"5E6D7E"];
}

#pragma mark - Debug Colors

+ (UIColor *)uc_debugRedColor
{
  return [UIColor colorFromHexString:@"D36562"];
}

+ (UIColor *)uc_debugGreenColor
{
  return [UIColor colorFromHexString:@"61C779"];
}

+ (UIColor *)uc_debugBlueColor
{
  return [UIColor colorFromHexString:@"539BCF"];
}

#pragma mark - Song/Ex

+ (UIColor *)uc_collectionBackgroundColor
{
  return [UIColor colorFromHexString:@"2B3847"];
}

+ (UIColor *)uc_songBackgroundColor
{
  return [UIColor colorFromHexString:@"44576C"];
}

+ (UIColor *)uc_exersiseBackgroundColor
{
  return [UIColor colorFromHexString:@"37475B"];
}

#pragma mark - Toolbar

+ (UIColor *)uc_barSeperatorLineColor
{
  return [UIColor colorFromHexString:@"505D69"];
}

+ (UIColor *)uc_separatorColor
{
  return [UIColor colorFromHexString:@"637486"];
}

+ (UIColor *)uc_barBackgroundColor
{
  return [UIColor uc_darkBlueBackground];
}

+ (UIColor *)uc_navigationbarBackgroundColor
{
  return [UIColor colorFromHexString:@"324052"];
}

+ (UIColor *)uc_lightBlueColor
{
  return [UIColor colorFromHexString:@"37475B"];
}

#pragma mark - UIColors from HEX values

+ (UIColor *)uc_learningPathOrangeColor
{
  return [UIColor colorFromHexString:@"FF8321"];
}

+ (UIColor *)uc_hexEEEEEEColor
{
  return [UIColor colorFromHexString:@"EEEEEE"];
}

+ (UIColor *)uc_hex999999Color
{
  return [UIColor colorFromHexString:@"999999"];
}

+ (UIColor *)uc_hexBBBBBBColor
{
  return [UIColor uc_hexBBBBBBColorWithAlpha:1.0];
}

+ (UIColor *)uc_hexBBBBBBColorWithAlpha:(CGFloat)alpha
{
  return [UIColor colorFromHexString:@"BBBBBB" alpha:alpha];
}

// Use Hex values for the sake of simplicity :)
+ (NSArray *)uc_hexValuesForDots
{
  return @[@"DA0401", @"E62D0B", @"EC4411", @"F66619", @"FF8321"];
}

+ (NSArray *)uc_learningPathsActiveExerciseGradientColors
{
  return @[[UIColor colorFromHexString:@"FF8321"], [UIColor colorFromHexString:@"D90200"]];
}

#pragma mark - Onboarding colors

+ (NSArray <__kindof UIColor*>*)uc_onboardingButtonGradientColors
{
  return @[[UIColor colorFromHexString:@"F56218"], [UIColor colorFromHexString:@"DD1003"]];
}

#pragma mark - LearningPath List colors

+ (UIColor *)uc_learningPathCellAvailableColor
{
  return [UIColor colorFromHexString:@"324052" alpha:0.8];
}

+ (UIColor *)uc_learningPathCellSelectedColor
{
  return [UIColor colorFromHexString:@"637496" alpha:0.9];
}

+ (UIColor *)uc_learningPathCellDetailsColor
{
  return [UIColor colorFromHexString:@"242e3a" alpha:0.6];
}


@end
