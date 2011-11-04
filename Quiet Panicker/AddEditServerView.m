//
//  AddEditServerView.m
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Quiet_PanickerAppDelegate.h"
#import "AddEditServerView.h"
#import "DashBoardView.h"

@implementation AddEditServerView

@synthesize index;

-(id) initWithIndex:(int) idx{
    self = [super init];
    if (self){
        self.index = idx;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark Buttons

-(void) doSaveServer{
    if (self.index >=0)
    {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    else{
        Quiet_PanickerAppDelegate * delegate = [[UIApplication sharedApplication]delegate];
        [delegate.window setRootViewController:[[UINavigationController alloc] initWithRootViewController:[[DashBoardView alloc] init]]];
    }
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(doSaveServer)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    [saveButton release];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
