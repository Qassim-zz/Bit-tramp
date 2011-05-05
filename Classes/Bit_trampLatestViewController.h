//
//  Bit_trampLatestViewController.h
//  Bit-trampLatest
//
//  Created by Qassim farid on 06/11/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>
#import "TouchXML.h"

@interface Bit_trampLatestViewController : UIViewController {
	IBOutlet UITableView *blogTable;
	NSMutableArray *blogEntries;
	NSTimer *timer;
	UIBarButtonItem *refreshFeed;
    UIActivityIndicatorView *loadSwirl;
}


-(IBAction) alertHelp:(id)sender;
-(IBAction) refreshFeed:(id)sender;

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *loadSwirl;


@end

