//
//  Bit_trampLatestViewController.m
//  Bit-trampLatest
//
//  Created by Qassim farid on 06/11/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "Bit_trampLatestViewController.h"

@implementation Bit_trampLatestViewController

@synthesize loadSwirl;

-(IBAction) alertHelp:(id)sender {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Help"
						  message:@"Hold Cell for definition. Tap cell and Play button for audio pronunciation"
						  delegate:self
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
}


-(void) grabRSSFeed:(NSString *)blogAddress {
    
    blogEntries = [[NSMutableArray alloc] init];	
    NSURL *url = [NSURL URLWithString: blogAddress];
    CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithContentsOfURL:url options:0 error:nil] autorelease];
    NSArray *resultNodes = NULL;
    resultNodes = [rssParser nodesForXPath:@"//item" error:nil];
    for (CXMLElement *resultElement in resultNodes) {
        NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
        int counter;
        for(counter = 0; counter < [resultElement childCount]; counter++) {
            [blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
        }
        [blogEntries addObject:[blogItem copy]];
    }
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	if ([blogEntries count] == 0) {
		NSString *blogAddress = @"http://doubt-it.com/?feed=rss2";
		[self grabRSSFeed:blogAddress];
		[blogTable reloadData];
	}
}


- (IBAction) refreshFeed:(id)sender {
	[loadSwirl startAnimating];
	NSString *blogAddress = @"http://doubt-it.com/?feed=rss2";
	[self grabRSSFeed:blogAddress];
	[blogTable reloadData];
	timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(activity) userInfo:nil repeats:NO];
}

-(void)activity {
	[loadSwirl stopAnimating];
	[blogTable reloadData];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {	
	return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [blogEntries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	int blogEntryIndex = [indexPath indexAtPosition: [indexPath length] -1];
	[cell setText:[[blogEntries objectAtIndex: blogEntryIndex] objectForKey: @"title"]];
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
	/*
	 ( *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
}

- (void)dealloc {
    [super dealloc];
    [loadSwirl dealloc];
    [timer dealloc];
}

@end