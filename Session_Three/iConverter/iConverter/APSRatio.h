//
//  APSRatio.h
//  iConverter
//
//  Created by David Harver Pollak on 13/03/14.
//  Copyright (c) 2014 David Harver Pollak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APSRatio : NSObject

@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *toName;
@property (nonatomic, assign) float ratio;

@end
