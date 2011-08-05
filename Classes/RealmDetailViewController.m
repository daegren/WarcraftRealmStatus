//
//  RealmDetailViewController.m
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-07-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RealmDetailViewController.h"
#import "Realm.h"
#import "RealmManager.h"


@implementation RealmDetailViewController

@synthesize name, status, statusImage, realmType, queue, population;
@synthesize realm;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (id)initWithRealm:(Realm *)newRealm
{
	self = [super init];
		if (self) self.realm = newRealm;
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = self.realm.name;
	name.text = self.realm.name;
	if ([self.realm.status boolValue]) {status.text =  @"Online"; } else {status.text =  @"Offline"; } 
	NSString *p = @"unknown.png";
	if ([self.realm.status boolValue])
		p = @"online.png";
	else 
		p = @"offline.png";

	statusImage.image = [UIImage imageNamed:p];
	population.text = [self.realm.population capitalizedString];
	realmType.text = [self.realm.type uppercaseString];
	queue.text = self.realm.queue ? @"None" : @"Yes";
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.name = nil;
	self.status = nil;
	self.statusImage = nil;
	self.population = nil;
	self.realmType = nil;
	self.queue = nil;
}


- (void)dealloc {
	[realm release];
    [super dealloc];
}


@end
