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
	
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://us.battle.net/api/wow/realm/status/%@", realmName]];
	
	NSString *json = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
	
	if (err) NSLog(@"%@",[err localizedDescription]);
	
	Realm *t = [[Realm alloc] init];
	
	return t;
	
}

+ (Realm *)getRealm:(NSString *)realmName fromRealmFile:(NSString *)path
{
	// read json from file path and return a Realm object.
	
	NSError *err = nil;

	NSString *json = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
	
	if (err) NSLog(@"%@",[err localizedDescription]);
	
	Realm *t = [[Realm alloc] init];
	
	return t;
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
}

+ (NSArray *) getRealms:(NSArray *)realms
{
}

+ (NSArray *) getRealms:(NSArray *)realms fromRealmFile:(NSString *)path
{
}

@end
