//
//  Bit_trampLatestAppDelegate.h
//  Bit-trampLatest
//
//  Created by Qassim farid on 06/11/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Bit_trampLatestViewController;

@interface Bit_trampLatestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Bit_trampLatestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Bit_trampLatestViewController *viewController;

@end

