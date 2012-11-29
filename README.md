FatSecretKit
============

iOS Client for the FatSecret API.

## Installation

Install via [CocoaPods](http://cocoapods.org) by adding this to your `Podfile`:

```
pod 'FatSecretKit'
```

## Usage
The toughest part of making your own client is the OAuth negotiation, so this should save you some precious hours. All you need is your OAuth consumer key and secret. Preferred usage is through the `sharedClient`:

```
[FSClient sharedClient].oauthConsumerKey = @"12345";
[FSClient sharedClient].oauthConsumerSecret = @"67890" ;
```

You should put that in your `AppDelegate.m` or similar, where it will only run once. You can always create your own clients with the usual `[[FSClient alloc] init]`.

You're all set to use the APIs.

### Food Search

```
[[FSClient sharedClient] searchFoods:term
						  completion:^(NSArray *foods, NSInteger maxResults, NSInteger totalResults, NSInteger pageNumber) {
	// Use data as you will.
	self.foods = foods;
	[self.tableView reloadData];
}];

// A more verbose version of the above, if you want to utilize the full paramters of the API
[[FSClient sharedClient] searchFoods:term
						  pageNumber:0
						  maxResults:50
						  completion:^(NSArray *foods, NSInteger maxResults, NSInteger totalResults, NSInteger pageNumber) {
	// Use data as you will.
	self.foods = foods;
	[self.tableView reloadData];
}];

```

### Get Food

```
[[FSClient sharedClient] getFood:item.identifier
                      completion:^(FSFood *food) {
                          NSLog(@"Name: %@", food.name)
                      }];

```

There are also native objects to represent resources returned by the API, including [`FSFood`](https://github.com/mysterioustrousers/FatSecretKit/blob/master/FatSecretKit/FatSecret/FSFood.h), which represents a food resource, and [`FSServing`](https://github.com/mysterioustrousers/FatSecretKit/blob/master/FatSecretKit/FatSecret/FSServing.h), which represents the servings for each food, returned by the `food.get` API method (among others).

## Limitations (and To-do list)

* Only supports requests not specific to a user. In other words, it does not currently support [Delegated requests](http://platform.fatsecret.com/api/Default.aspx?screen=rapiauth)
* All API methods are not implemented, only a few specific ones that Mysterious Trousers has had need for. Adding support for other APIs should be rather trivial, however. See the Contributing section.

## Contributing

New methods for fetching resources should be added to the `FSClient` class, and new native objects can be created as necessary. Naming conventions for client methods should follow the same convention:

API: `foods.search`, iOS: `searchFoods`

API: `food.get`, iOS: `getFood`

etc.

New methods/properties on native objects should follow a similar convention

API: `trans_fat`, iOS: `transFat`

API: `saturated_fat`, iOS: `saturatedFat`

etc.

Adding support for new API methods should create an appropriately named method inside `FSClient`, and it should support all required **and** optional parameters, though convenience methods are also welcome (see `searchFoods` methods as a reference.) 

### Process:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request