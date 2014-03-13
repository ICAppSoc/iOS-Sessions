//
//  APSRatio.m
//  iConverter
//
//  Created by David Harver Pollak on 13/03/14.
//  Copyright (c) 2014 David Harver Pollak. All rights reserved.
//

#import "APSRatio.h"

@implementation APSRatio

- (id)init {
    self = [super init];
    if (self) {
        self.fromName = @"default from";
        self.toName = @"default to";
        self.ratio = 1;
    }
    
    return self;
}

@end
