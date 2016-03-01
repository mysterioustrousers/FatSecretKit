//
//  FSViewController.m
//  FatSecretKit
//
//  Created by Parker Wightman on 11/28/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "FSViewController.h"
#import "FatSecret/FSClient.h"

@interface FSViewController ()

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Replace with your own keys if you want to test.
	[FSClient sharedClient].oauthConsumerKey = @"123";
	[FSClient sharedClient].oauthConsumerSecret = @"456";
	
	[[FSClient sharedClient] searchFoods:@"butter" 
							  completion:^(NSArray *foods, NSInteger maxResults, NSInteger totalResults, NSInteger pageNumber) {
		NSLog(@"%@", foods);
	}];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
