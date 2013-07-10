//
//  PlayViewController.m
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import "PlayViewController.h"
#define kFileName @"data.plist"

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
    //let plist word into array
    
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

-(NSString *)getCurrentTime
{
    NSDate * date = [NSDate date];
    NSTimeInterval sec = [date timeIntervalSinceNow];
    NSDate * currentDate=[[NSDate alloc] initWithTimeIntervalSinceNow:sec];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * now = [dateFormat stringFromDate:currentDate];
    
    return now;

}

- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return[documentsDirectory stringByAppendingPathComponent:kFileName];
}

-(void)showWord
{
    self.list = [[NSArray alloc]initWithContentsOfFile:[self dataFilePath]];
    self.WordShow.text = [NSString stringWithFormat:@"%@",self.WordShow.text];
}

-(void)hideWord
{
    self.WordShow.text=nil;
}

-(Boolean)isWordTrue:(NSString *)wordtmp
{
    
    
}

-(void)showResult
{
    
}

- (IBAction)WordInput:(id)sender {
}
- (IBAction)Go:(id)sender {
}
@end
