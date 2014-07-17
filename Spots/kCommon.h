//
//  kCommon.h
//  CatchMe
//
//  Created by Thiruvengadam Krishnasamy on 05/04/14.
//  Copyright (c) 2014 TWILIGHT SOFTWARES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kCommon : NSObject
+(void) showLoader:(UIViewController*) parent withText:(NSString*) txt;
+(void) hideLoader;
@end
