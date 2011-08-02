//
//  RealmDetailViewController.h
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-07-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Realm.h"

@interface RealmDetailViewController : UIViewController {
	IBOutlet UILabel *name;
	IBOutlet UILabel *status;
	IBOutlet UIImageView *statusImage;
	IBOutlet UILabel *realmType;
	IBOutlet UILabel *population;
	IBOutlet UILabel *queue;
	IBOutlet UITextView *test;
	Realm *realm;
}

- (id) initWithRealm:(Realm *)newRealm;

@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *status;
@property (nonatomic, retain) UILabel *realmType;
@property (nonatomic, retain) UILabel *population;
@property (nonatomic, retain) UILabel *queue;
@property (nonatomic, retain) UIImageView *statusImage;
@property (retain) Realm *realm;

@end
