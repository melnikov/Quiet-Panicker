//
//  DashBoardView.h
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimplePing.h"
#import "Quiet_PanickerAppDelegate.h"
#import "SimplePing.h"


@interface DashBoardView : UIViewController <UITableViewDelegate, UITableViewDataSource,SimplePingDelegate>{
    IBOutlet UITableView * tableView;
    Quiet_PanickerAppDelegate * delegate;
    SimplePing * pinger;
    
}




@end
