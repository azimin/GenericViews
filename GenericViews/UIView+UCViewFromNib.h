//
//  UIView+UCViewFromNib.h
//  Uberchord
//
//  Created by Rafał on 10.10.2014.
//  Copyright (c) 2014 Uberchord Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UCViewFromNib)

+ (instancetype)uc_viewFromNib;
+ (instancetype)uc_viewFromNibWithOwner:(id)owner;
+ (instancetype)uc_viewFromNibWithName:(NSString *)nibName withOwner:(id)owner;
- (instancetype)uc_loadFromNibIfEmbeddedInDifferentNib;
- (instancetype)uc_loadFromNibWithNameIfEmbeddedInDifferentNib:(NSString *)nibName;

@end
