//
//  DashBoardView.h
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiet_PanickerAppDelegate.h"


@interface DashBoardView : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UITableView * tableView;
    Quiet_PanickerAppDelegate * delegate;
    
}




@end
