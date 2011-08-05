//
//  RealmManager.m
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-07-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RealmManager.h"
#import "SBJson.h"


@implementation RealmManager

+ (Realm *)getRealm:(NSString *)realmName
{
	NSError *err = nil;
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://us.battle.net/api/wow/realm/status?realms=%@", realmName]];
	
	NSString *json = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];

	if (err) NSLog(@"%@",[err localizedDescription]);

	SBJsonParser *parser = [SBJsonParser new];
	NSDictionary *data = [parser objectWithString:json];
	NSDictionary *realm = [data objectForKey:@"realms"];
	
	Realm *r = [[Realm alloc] init];
	
	r.type = [realm objectForKey:@"type"];
	r.queue = [realm objectForKey:@"queue"];
	r.status = [realm objectForKey:@"status"];
	r.population = [realm objectForKey:@"population"];
	r.name = [realm	objectForKey:@"name"];
	r.slug = [realm objectForKey:@"slug"];
	
	return r;
	
}

+ (NSArray *) getAllRealms
{
	NSError *err = nil;
	
	NSURL *url = [NSURL URLWithString:@"http://us.battle.net/api/wow/realm/status"];
	
	NSString *json = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
	
	//NSString *json = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"status" ofType:@"json"]];
	
	if (err) NSLog(@"%@",[err localizedDescription]);

	NSMutableArray *array = [NSMutableArray array]; 
	
	SBJsonParser *parser = [SBJsonParser new];
	
	NSDictionary *data = [parser objectWithString:json];
	NSDictionary *realms = [data objectForKey:@"realms"];
	
	Realm *r;
	
	for (NSDictionary *realm in realms)
	{
		r = [[Realm alloc]init];
		NSLog(@"Parsed a realm:\n");
		
		// get realm name;
		r.name = [realm objectForKey:@"name"];
		NSLog(@"\tName: %@", r.name);
		
		// get realm slug;
		r.slug = [realm objectForKey:@"slug"];
		NSLog(@"\tSlug: %@", r.slug);
		
		// get realm type;
		r.type = [realm objectForKey:@"type"];
		NSLog(@"\tType: %@", r.type);
		
		// get realm queue;
		r.queue = [realm objectForKey:@"queue"];
		NSLog(@"\tQueue: %@", r.queue);
		
		// get realm status;
		r.status = [realm objectForKey:@"status"];
		NSLog(@"\tStatus: %@", r.status);
		
		// get realm population;
		r.population = [realm objectForKey:@"population"];
		NSLog(@"\tPopulation: %@", r.population);
		
		// add to array
		[array addObject:r];
	}
	
	return array;
}

+ (NSArray *) getAllRealmsFromRealmFile:(NSString *)path
{
	NSError *err = nil;
	
	NSString *json = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"status" ofType:@"json"]
											   encoding:NSUTF8StringEncoding
												  error:&err];
	
	if (err) NSLog(@"%@",[err localizedDescription]);
	
	NSMutableArray *array = [NSMutableArray array]; 
	
	SBJsonParser *parser = [SBJsonParser new];
	
	NSDictionary *data = [parser objectWithString:json];
	NSDictionary *realms = [data objectForKey:@"realms"];
	
	Realm *r;
	
	for (NSDictionary *realm in realms)
	{
		r = [[Realm alloc]init];
		NSLog(@"Parsed a realm:\n");
		
		// get realm name;
		r.name = [realm objectForKey:@"name"];
		NSLog(@"\tName: %@", r.name);
		
		// get realm slug;
		r.slug = [realm objectForKey:@"slug"];
		NSLog(@"\tSlug: %@", r.slug);
		
		// get realm type;
		r.type = [realm objectForKey:@"type"];
		NSLog(@"\tType: %@", r.type);
		
		// get realm queue;
		r.queue = [realm objectForKey:@"queue"];
		NSLog(@"\tQueue: %@", r.queue);
		
		// get realm status;
		r.status = [realm objectForKey:@"status"];
		NSLog(@"\tStatus: %@", r.status);
		
		// get realm population;
		r.population = [realm objectForKey:@"population"];
		NSLog(@"\tPopulation: %@", r.population);
		
		// add to array
		[array addObject:r];
	}
	
	return array;
}

+ (NSArray *) getRealms:(NSArray *)realms
{
	NSError *err = nil;
	NSMutableArray *array = [NSMutableArray array];
	NSMutableString *sb = [NSMutableString string];
	
	for (NSString *s in realms)
	{
		[sb appendFormat:@",%@",s];
	}
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://us.battle.net/api/wow/realm/status?realms=%@", sb]];
	
	NSString *json = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
	
	if (err) NSLog(@"%@",[err localizedDescription]);
	
	SBJsonParser *parser = [SBJsonParser new];
	NSDictionary *data = [parser objectWithString:json];
	
	Realm *r;
	
	for (NSDictionary *realm in data)
	{
		r = [[Realm alloc] init]; // new realm object
		
		// assing data
		r.type = [realm objectForKey:@"type"];
		r.queue = [realm objectForKey:@"queue"];
		r.status = [realm objectForKey:@"status"];
		r.population = [realm objectForKey:@"population"];
		r.name = [realm	objectForKey:@"name"];
		r.slug = [realm objectForKey:@"slug"];
		
		// add realm to array
		[array addObject:r];
	}
	
	// return array
	return [array autorelease];
}

@end
