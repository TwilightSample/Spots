//
//  kCommon.m
//  CatchMe
//
//  Created by Thiruvengadam Krishnasamy on 05/04/14.
//  Copyright (c) 2014 TWILIGHT SOFTWARES. All rights reserved.
//

#import "kCommon.h"
#import "DejalActivityView.h"
@implementation kCommon

+(void) showLoader:(UIViewController*) parent withText:(NSString*) txt
{
    [DejalBezelActivityView activityViewForView:parent.view withLabel:txt];
}

+(void) hideLoader
{
    [DejalBezelActivityView removeViewAnimated:YES];
}

@end
