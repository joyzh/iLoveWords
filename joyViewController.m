//
//  joyViewController.m
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import "joyViewController.h"
#import "PlayViewController.h"
#import "HelpViewController.h"
#import "AboutViewController.h"

@interface joyViewController ()

@end

@implementation joyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Play:(id)sender
{
    PlayViewController *ctrl=[[PlayViewController alloc]init];
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (IBAction)Help:(id)sender
{
    HelpViewController *ctrl=[[HelpViewController alloc]init];
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (IBAction)About:(id)sender
{
    AboutViewController *ctrl=[[AboutViewController alloc]init];
    [self presentViewController:ctrl animated:YES completion:nil];

}
@end
