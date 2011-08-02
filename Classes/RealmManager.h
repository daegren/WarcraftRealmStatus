//
//  RealmManager.h
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-07-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"

@interface RealmManager : NSObject {
}

+ (NSArray *)getAllRealms;
+ (NSArray *)getAllRealmsFromRealmFile:(NSString *)path;
+ (Realm *)getRealm:(NSString *)realmName;
+ (Realm *)getRealm:(NSString	*)realmName fromRealmFile:(NSString *)path;
+ (NSArray *)getRealms:(NSArray *)realms;
+ (NSArray *)getRealms:(NSArray *)realms fromRealmFile:(NSString *)path;


@end
