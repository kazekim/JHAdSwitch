//
//  JHAdView.h
//  DetDuang
//
//  Created by KaZeKiM Macbook Pro on 6/11/14.
//  Copyright (c) 2014 dreamentum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google-AdMob-Ads-SDK/GADBannerViewDelegate.h>

@class GADBannerView;
@class GADRequest;

@interface JHAdView : UIView

-(void)setParentViewController:(UIViewController *)parentViewController;
-(void)loadRequestAdmob;
-(void)refresh;

+(void)setGAdmobID:(NSString *)gAdmobID;

@end

static NSString *jhAdViewGAdmobID = @"Ad mob ID Here";