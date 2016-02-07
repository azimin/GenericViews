//
//  UIColor+UberchordColors.h
//  Uberchord
//
//  Created by Rafał on 08.10.2014.
//  Copyright (c) 2014 Uberchord Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UCColors)

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (UIColor *)colorFromHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)uc_red;
+ (UIColor *)uc_green;
+ (UIColor *)uc_orange;
+ (UIColor *)uc_darkOrange;
+ (UIColor *)uc_lightBlueGreen;
+ (UIColor *)uc_darkBlue;

+ (UIColor *)uc_darkBlackColor;

+ (UIColor *)uc_grayColor;
+ (UIColor *)uc_darkGrayBlue;
+ (UIColor *)uc_darkGrayBlueBackground;
+ (UIColor *)uc_darkBlueBackground;
+ (UIColor *)uc_darkBlueBackgroundElementColor;

+ (UIColor *)uc_keyboardBackground;

+ (UIColor *)uc_statisticsBlueColor;
+ (UIColor *)uc_statisticsGreenColor;
+ (UIColor *)uc_statisticsGreyColor;
+ (UIColor *)uc_statisticsLineGreyColor;

+ (UIColor *)uc_lightGray;
+ (UIColor *)uc_lightGrayBlue;
+ (UIColor *)uc_mediumGray;

+ (UIColor *)uc_pullToRevealLightGray;
+ (UIColor *)uc_pullToRevealDarkGray;

+ (UIColor *)uc_normalChordColor;
+ (UIColor *)uc_correctChordColor;
+ (UIColor *)uc_wrongChordColor;

+ (UIColor *)uc_darkGray;

+ (UIColor *)uc_exerciseColor;

#pragma mark - Song/Ex

+ (UIColor *)uc_collectionBackgroundColor;
+ (UIColor *)uc_songBackgroundColor;
+ (UIColor *)uc_exersiseBackgroundColor;

#pragma mark - Toolbar

+ (UIColor *)uc_separatorColor;
+ (UIColor *)uc_barSeperatorLineColor;
+ (UIColor *)uc_barBackgroundColor;
+ (UIColor *)uc_navigationbarBackgroundColor;

+ (UIColor *)uc_lpDotInactiveColor;
+ (UIColor *)uc_lpDotOnColor;
+ (UIColor *)uc_lpDotOffColor;

+ (UIColor *)uc_learningPathOrangeColor;
+ (UIColor *)uc_hexEEEEEEColor;
+ (UIColor *)uc_hex999999Color;
+ (UIColor *)uc_hexBBBBBBColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)uc_hexBBBBBBColor;
+ (UIColor *)uc_lightBlueColor;

#pragma mark - NeedleView

+ (UIColor *)uc_needleViewWrongState;
+ (UIColor *)uc_needleViewCorrectState;

#pragma mark - Select tuning

+ (UIColor *)uc_selectedTuningColor;
+ (UIColor *)uc_unavailableTuningColor;
+ (UIColor *)uc_tuningColor;
+ (UIColor *)uc_tuningSuccessColor;

#pragma mark - Meter bar colors
+ (NSArray<UIColor *> *)uc_meterBarColors;
+ (NSArray<NSNumber *> *)uc_meterBarLocations;
+ (UIColor *)uc_meterBarBackgroundColor;

#pragma mark - Onboarding colors

+ (NSArray <__kindof UIColor*>*)uc_onboardingButtonGradientColors;

#pragma mark - LearningPath List colors

+ (UIColor *)uc_learningPathCellAvailableColor;
+ (UIColor *)uc_learningPathCellSelectedColor;
+ (UIColor *)uc_learningPathCellDetailsColor;

#pragma mark - Debug Colors

+ (UIColor *)uc_debugRedColor;
+ (UIColor *)uc_debugGreenColor;
+ (UIColor *)uc_debugBlueColor;

+ (UIColor *)uc_learningPathsActiveExerciseColor;
+ (UIColor *)uc_learningPathsInactiveExerciseColor;
// List of colors (UIColor) for the active exercise bubble
+ (NSArray <__kindof UIColor*>*)uc_learningPathsActiveExerciseGradientColors;

@end
