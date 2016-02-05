//
//  UIView+UCViewFromNib.m
//  Uberchord
//
//  Created by Rafał on 10.10.2014.
//  Copyright (c) 2014 Uberchord Engineering. All rights reserved.
//

#import "UIView+UCViewFromNib.h"

@implementation UIView (UCViewFromNib)

+ (instancetype)uc_viewFromNib
{
  return [[self class] uc_viewFromNibWithOwner:nil];
}

+ (instancetype)uc_viewFromNibWithOwner:(id)owner
{
  return [self uc_viewFromNibWithName:nil withOwner:owner];
}

+ (instancetype)uc_viewFromNibWithName:(NSString *)nibName withOwner:(id)owner
{
  nibName = nibName ?: NSStringFromClass(self);
  id view = [[[UINib nibWithNibName:nibName bundle:nil] instantiateWithOwner:owner options:nil] firstObject];
  
  NSAssert([view isKindOfClass:self], nil);
  
  return view;
}

- (instancetype)uc_loadFromNibWithNameIfEmbeddedInDifferentNib:(NSString *)nibName
{
  // based on: http://blog.yangmeyer.de/blog/2012/07/09/an-update-on-nested-nib-loading
  
  BOOL isJustAPlaceholder = self.subviews.count == 0;
  if (isJustAPlaceholder) {
    typeof(self) theRealThing = [[self class] uc_viewFromNibWithName:nibName withOwner:nil];

    theRealThing.frame = self.frame;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    theRealThing.translatesAutoresizingMaskIntoConstraints = NO;
    
    return theRealThing;
  }
  
  return self;
}

- (instancetype)uc_loadFromNibIfEmbeddedInDifferentNib
{
  return [self uc_loadFromNibWithNameIfEmbeddedInDifferentNib:nil];
}

@end
