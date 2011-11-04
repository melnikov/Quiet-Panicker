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
}
@property (nonatomic,readwrite) int index;
-(id) initWithIndex:(int) idx;
@end
