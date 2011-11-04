//
//  Quiet_PanickerAppDelegate.h
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Quiet_PanickerAppDelegate : NSObject <UIApplicationDelegate> {
    NSMutableArray * servers;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, assign) NSMutableArray * servers;

@end
