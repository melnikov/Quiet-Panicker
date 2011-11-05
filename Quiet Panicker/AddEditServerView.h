//
//  AddEditServerView.h
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddEditServerView : UIViewController {
 
    int index;
    IBOutlet UITextField * edName;
    IBOutlet UISwitch * swWOL;
    
}

@property (nonatomic,readwrite) int index;
@property (nonatomic, retain) IBOutlet UITextField * edName;
@property (nonatomic, retain) IBOutlet UISwitch * swWOL;

-(id) initWithIndex:(int) idx;

@end
