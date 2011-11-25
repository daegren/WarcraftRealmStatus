//
//  FavouriteRealmViewController.h
//  WarcraftRealmStatus
//
//  Created by  David Mills on 11-08-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FavouriteRealmViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	NSDictionary *_favouriteRealms;
    NSArray *_sections;
}

@property (retain) NSDictionary *favouriteRealms;

@end
