//
//  DashBoardView.m
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DashBoardView.h"
#import "AddEditServerView.h"
#import "Quiet_PanickerAppDelegate.h"
#import "SimplePing.h"

@implementation DashBoardView



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

#pragma mark Table Functions

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int a = [delegate.servers count]; 
    
    return [delegate.servers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSDictionary * server = [delegate.servers objectAtIndex:indexPath.row];
    [cell.textLabel setText:[server objectForKey:@"name"]];
    [cell.detailTextLabel setText:@"Inactive"];
    [cell.imageView setImage:[[UIImage imageNamed:@"red.png"]autorelease]];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [delegate.servers removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

-(void) sendPing{
    [pinger sendPingWithData:nil];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * tmp = [delegate.servers objectAtIndex:indexPath.row];
    NSString * serverName = [tmp valueForKey:@"name"];
    pinger = [SimplePing simplePingWithHostName:serverName];
    pinger.delegate = self;
    [pinger start];
    
  //  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(sendPing) userInfo:nil repeats:YES];
    
   do {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    } while (pinger != nil);
    
    int a;
    a=0;
    
}

#pragma mark Buttons

-(void) didClickAddBarButton{
    AddEditServerView * ev = [[AddEditServerView alloc] initWithIndex:-1];
    [self.navigationController pushViewController:ev animated:YES];
    [ev release];
}

-(void) didClickEditBarButton{
    [tableView setEditing:YES animated:YES];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    delegate = [[UIApplication sharedApplication] delegate];
    self.title = @"Server Dashboard";
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(didClickEditBarButton)];
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didClickAddBarButton)];

    [self.navigationItem setRightBarButtonItem:right];
    [right release];
    
    [self.navigationItem setLeftBarButtonItem:self.editButtonItem];
    [left release];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillAppear:(BOOL)animated{
    [tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated{
    [tableView setEditing:editing animated:animated];
    [super setEditing:editing animated:animated];
}

#pragma mark SimplePing delegate methods

- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address{
    NSLog(@"ping start");
    [pinger sendPingWithData:nil];
}
// Called after the SimplePing has successfully started up.  After this callback, you 
// can start sending pings via -sendPingWithData:

- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error{
    NSLog(@"ping fail: %@",error);
}

// If this is called, the SimplePing object has failed.  By the time this callback is 
// called, the object has stopped (that is, you don't need to call -stop yourself).

// IMPORTANT: On the send side the packet does not include an IP header. 
// On the receive side, it does.  In that case, use +[SimplePing icmpInPacket:] 
// to find the ICMP header within the packet.

- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet{
    NSLog(@"ping send");
}
// Called whenever the SimplePing object has successfully sent a ping packet. 

- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet error:(NSError *)error{
    NSLog(@"ping fail to send");
}

// Called whenever the SimplePing object tries and fails to send a ping packet.

- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet{
    NSLog(@"ping receive");
    [pinger release];
}

// Called whenever the SimplePing object receives an ICMP packet that looks like 
// a response to one of our pings (that is, has a valid ICMP checksum, has 
// an identifier that matches our identifier, and has a sequence number in 
// the range of sequence numbers that we've sent out).

- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet{
  //  NSLog(@"ping receive wrong");
     [pinger release];
}

// Called whenever the SimplePing object receives an ICMP packet that does not 
// look like a response to one of our pings.



@end
