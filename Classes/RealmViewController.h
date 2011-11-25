//
//  RealmViewController.h
//  WarcraftRealmStatus
//
//  Created by David Mills on 11-07-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RealmViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate> {
	NSDictionary *_realms;
	NSArray *_sections;
	IBOutlet UISearchBar *_searchBar;
}

- (id)initWithRealms:(NSArray *)newRealms withStyle:(UITableViewStyle)style;

@property (retain) NSDictionary *_realms;
@property (retain, readonly) NSArray *_sections;
@property (retain) UISearchBar *_searchBar;

@end
