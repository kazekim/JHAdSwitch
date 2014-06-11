//
//  JHAdView.m
//  DetDuang
//
//  Created by KaZeKiM Macbook Pro on 6/11/14.
//  Copyright (c) 2014 dreamentum. All rights reserved.
//

#import "JHAdView.h"
#import <iAd/iAd.h>
#import <Google-AdMob-Ads-SDK/GADBannerView.h>
#import <Google-AdMob-Ads-SDK/GADRequest.h>

@interface JHAdView() <ADBannerViewDelegate,GADBannerViewDelegate>

@property (nonatomic, strong) IBOutlet UIViewController *parentViewController;

@property(nonatomic, strong) GADBannerView *gAdBannerView;
@property(nonatomic, strong) ADBannerView *iAdBannerView;

@end

@implementation JHAdView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setupLayout];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setupLayout];
    }
    return self;
}

#pragma mark setup

-(void)setupLayout
{
    [self initiAdBanner];
    [self initAdmobBanner];
}

-(void)initiAdBanner
{
    if (!self.iAdBannerView)
    {
        CGRect rect = CGRectMake(0, 0, self.frame.size.width , self.frame.size.height);
        self.iAdBannerView = [[ADBannerView alloc]initWithFrame:rect];
        self.iAdBannerView.delegate = self;
        self.iAdBannerView.hidden = TRUE;
        [self addSubview:self.iAdBannerView];
    }
}

-(void)initAdmobBanner
{
    if(!self.gAdBannerView){
        CGPoint origin = CGPointMake(0.0,0.0);
        self.gAdBannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner origin:origin];
        
        // Note: Edit SampleConstants.h to provide a definition for kSampleAdUnitID before compiling.
        self.gAdBannerView.adUnitID = self.gAdmobUnitID;
        self.gAdBannerView.delegate = self;
        
        
        [self addSubview:self.gAdBannerView];
    }
}

#pragma mark GET/SET value

-(NSString *)gAdmobUnitID
{
    return jhAdViewGAdmobID;
}

-(void)setParentViewController:(UIViewController *)parentViewController
{
    _parentViewController = parentViewController;
    self.gAdBannerView.rootViewController = parentViewController;
}

#pragma mark GADRequest generation

- (GADRequest *)request {
    GADRequest *request = [GADRequest request];
    
    // Make the request for a test ad. Put in an identifier for the simulator as well as any devices
    // you want to receive test ads.
    request.testDevices = @[
                            // TODO: Add your device/simulator test identifiers here. Your device identifier is printed to
                            // the console when the app is launched.
                            GAD_SIMULATOR_ID
                            ];
    return request;
}

#pragma mark GADBannerViewDelegate implementation

// We've received an ad successfully.
- (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"Received ad successfully");
    [self hideBanner:self.iAdBannerView];
    [self showBanner:self.gAdBannerView];
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Failed to receive ad with error: %@", [error localizedFailureReason]);
    [self hideBanner:self.gAdBannerView];
}

#pragma mark ADBannerViewDelegate implementation

// Called before the add is shown, time to move the view
- (void)bannerViewWillLoadAd:(ADBannerView *)banner
{
    NSLog(@"iAd load");
    [self hideBanner:self.gAdBannerView];
    [self showBanner:self.iAdBannerView];
}

// Called when an error occured
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"iAd error: %@", error);
    [self hideBanner:self.iAdBannerView];
    [self.gAdBannerView loadRequest:[GADRequest request]];
}

#pragma mark class methods
-(void)loadRequestAdmob
{
    [self.gAdBannerView loadRequest:[self request]];

}

-(void)refresh
{
    [self.iAdBannerView removeFromSuperview];
    self.iAdBannerView = nil;
    
    [self initiAdBanner];
}

#pragma mark hide/show banner
-(void)hideBanner:(UIView*)banner
{
    if (banner && ![banner isHidden])
    {
        [UIView beginAnimations:@"hideBanner" context:nil];
        banner.alpha = 0;
        [UIView commitAnimations];
        banner.hidden = TRUE;
    }
}

-(void)showBanner:(UIView*)banner
{
    if (banner && [banner isHidden])
    {
        [UIView beginAnimations:@"showBanner" context:nil];
        banner.alpha = 1;
        [UIView commitAnimations];
        banner.hidden = FALSE;
    }
}

#pragma mark Set GAdmob ID
+(void)setGAdmobID:(NSString *)gAdmobID
{
    jhAdViewGAdmobID = gAdmobID;
}


@end
