//
//  RealmViewController.m
//  WarcraftRealmStatus
//
//  Created by David Mills on 11-07-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RealmViewController.h"
#import "RealmDetailViewController.h"
#import "RealmManager.h"

@implementation RealmViewController

@synthesize _realms, _searchBar;

- (id) initWithRealms:(NSArray *)newRealms withStyle:(UITableViewStyle)style
{
	[super initWithNibName:@"RealmViewController" bundle:nil];
	NSMutableDictionary *realmSections = [[NSMutableDictionary dictionary] retain];
	NSMutableArray *realmSection;
	
    // get all the realm headers ('A', 'B', 'C', etc) leaving out headers which don't have any realms
	for (Realm *r in newRealms)
	{
		NSString *a = [[r.name substringToIndex:1] uppercaseString];
		
		if (![realmSections objectForKey:a])
		{
			realmSection = [NSMutableArray array]; 
			[realmSections setValue:realmSection forKey:a];
		}
		[realmSection addObject:r];
	}
	self._realms = realmSections;
	return self;
}

- (NSArray *)_sections
{
	if (!_sections) {
		_sections = [[[self._realms allKeys] sortedArrayUsingSelector:@selector(compare:)] retain];
	}
	return _sections;
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	[super viewDidLoad];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Search Bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	// run search
	[searchBar resignFirstResponder];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	return self._sections.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self._realms objectForKey:[self._sections objectAtIndex:section]] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"MyTVC";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
    // Configure the cell...
	Realm *r = [[_realms objectForKey:[_sections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	cell.textLabel.text = r.name;
	NSString *p;
	if ([r.status boolValue])
		p = @"online.png";
	else if ([r.status intValue] == 0)
		p = @"offline.png";
	else 
		p = @"unknown.png";
	
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Population: %@ Type: %@", [r.population capitalizedString], [r.type uppercaseString]];
			 
	cell.imageView.image = [UIImage imageNamed:p];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [_sections objectAtIndex:section];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    Realm *r = [[_realms objectForKey:[_sections objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
	
    RealmDetailViewController *detailViewController = [[RealmDetailViewController alloc] initWithRealm:r];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[_realms release];
	[_sections release];
    [super dealloc];
}


@end

