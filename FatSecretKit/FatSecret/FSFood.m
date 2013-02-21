//
//  FSFood.m
//  Tracker
//
//  Created by Parker Wightman on 11/27/12.
//  Copyright (c) 2012 Mysterious Trousers. All rights reserved.
//

#import "FSFood.h"
#import "FSServing.h"

@implementation FSFood

- (id) initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _name            = [json objectForKey:@"food_name"];
        _foodDescription = [json objectForKey:@"food_description"];
        _type            = [json objectForKey:@"food_type"];
        _url             = [json objectForKey:@"food_url"];
        _identifier      = [[json objectForKey:@"food_id"] integerValue];
        _brandName       = [json objectForKey:@"brand_name"];

        id servings = [json objectForKey:@"servings"];

        _servings = @[];

        if (servings) {
            servings = [servings objectForKey:@"serving"];

            // This is a hack to figure out if servings is an array or a dictionary
            // since the API returns a dictionary if there's only one serving (WTF?)
            if ([servings respondsToSelector:@selector(arrayByAddingObject:)]) {
                NSMutableArray *array = [@[] mutableCopy];
                for (NSDictionary *serving in servings) {
                    [array addObject:[FSServing servingWithJSON:serving]];
                }
                _servings = array;
            } else {
                if ([servings count] == 0) {
                    _servings = @[];
                } else {
                    _servings = @[ [FSServing servingWithJSON:servings] ];
                }
            }
        }
    }

    return self;
}

+ (id) foodWithJSON:(NSDictionary *)json {
    return [[self alloc] initWithJSON:json];
}


@end
