//
//  ViewController.m
//  JHAdSwitch
//
//  Created by KaZeKiM Macbook Pro on 6/11/14.
//  Copyright (c) 2014 kazekim. All rights reserved.
//

#import "ViewController.h"
#import "JHAdView.h"

@interface ViewController ()

@property (nonatomic,retain) IBOutlet JHAdView *adView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    
    //Refresh iAd
    [self.adView refresh];
    
    //Load Admob
//    [self.adView loadRequestAdmob];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
