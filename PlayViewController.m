//
//  PlayViewController.m
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.downtime=120.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)return:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showDownTime
{
    self.downtime=self.downtime-0.1;
    self.timestr=[NSString stringWithFormat:@"%04.1f",self.downtime];
    self.DownTime.text=self.timestr;
    
}

- (IBAction)WordInput:(id)sender {
}
- (IBAction)Go:(id)sender {
}
@end
