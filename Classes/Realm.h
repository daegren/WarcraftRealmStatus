//
//  Realm.h
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-07-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Realm : NSObject {
	NSString *name;
	NSString *slug;
	NSString *population;
	NSString *queue;
	NSString *status;
	NSString *type;
	NSString *test;
}

@property (copy) NSString *name;
@property (copy) NSString *slug;
@property (copy) NSString *population;
@property (copy) NSString *queue;
@property (copy) NSString *status;
@property (copy) NSString *type;
@property (copy) NSString *test;

@end
