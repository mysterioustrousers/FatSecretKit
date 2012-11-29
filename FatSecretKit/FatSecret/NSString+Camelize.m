//
//  NSString+Camelize.m
//  Tracker
//
//  Created by Parker Wightman on 11/28/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "NSString+Camelize.h"

@implementation NSString (Camelize)

- (NSString *)camelize {
	NSString *string = [self copy];
	
	NSRange range = [string rangeOfString:@"_"];
	
	while (range.location != NSNotFound) {
		string = [string stringByReplacingCharactersInRange:range withString:@""];
		NSString *letter = [string substringWithRange:range];
		letter = [letter uppercaseString];
		string = [string stringByReplacingCharactersInRange:range withString:letter];
		range = [string rangeOfString:@"_"];
	}
	
	return string;
}

@end
