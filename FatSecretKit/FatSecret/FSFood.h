//
//  FSFood.h
//  Tracker
//
//  Created by Parker Wightman on 11/27/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSFood : NSObject

@property (nonatomic, strong, readonly) NSString *foodDescription;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *type;
@property (nonatomic, strong, readonly) NSString *url;
@property (nonatomic, strong, readonly) NSString *brandName;
@property (nonatomic, assign, readonly) NSInteger identifier;

@property (nonatomic, strong, readonly) NSArray *servings;


+ (id) foodWithJSON:(NSDictionary *)json;

@end
