//
//  RealmManager.m
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-07-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RealmManager.h"
#import "SBJSON.h"


@implementation RealmManager

+ (Realm *)getRealm:(NSString *)realmName
{
}

+ (Realm *)getRealm:(NSString *)realmName fromRealmFile:(NSString *)path
{
	// read json from file path and return a Realm object.
	SBJSON *sbj = [[SBJSON alloc] init];
	
	NSString *json = [NSString stringWithContentsOfFile:@"Resources/status.json" encoding:(NSASCIIStringEncoding) error:nil];
	
	Realm *t = [[Realm alloc] init];
	t.test = json;
	return t;
}

@end
