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
	NSNumber *queue;
	NSNumber *status;
	NSString *type;
}

@property (copy) NSString *name;
@property (copy) NSString *slug;
@property (copy) NSString *population;
@property (copy) NSNumber *queue;
@property (copy) NSNumber *status;
@property (copy) NSString *type;

@end
