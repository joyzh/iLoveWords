//
//  PlayViewController.m
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import "PlayViewController.h"
#define kFileName @"WordList.plist"

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
    
    //initial varibles
    self.downtime=120.0;
    
    self.count=0;
    self.count_right=0;
    self.count_wrong=0;
    
    //let plist word into array
    self.list = [[NSArray alloc]initWithContentsOfFile:[self dataFilePath]];
    
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
    int y = arc4random() % 100;
    int x = y%4;
    //取出plist中的第x个元素
    self.curWord=[self.list objectAtIndex:x];
    
    self.WordShow.text = [NSString stringWithFormat:@"%@ %@",self.WordShow.text,_curWord];
    //what's the difference between _curWord and self.curWord
    
    //do the counting
    self.count=self.count+1;
}

-(void)hideWord
{
    self.WordShow.text=nil;
}

-(Boolean)isWordTrue:(NSString *)wordtmp
{
    NSString *inputWord=self.inputWord.text;
    if ([inputWord isEqualToString:self.curWord]) {
        //bingo sound
        
        self.count_right=self.count_right+1;
        return YES;
    }
    else
    {
        //wrong sound
        
        self.count_wrong=self.count_wrong+1;
        return NO;
    }
    
}

-(void)showResult
{
    NSString *tmp1 = [NSString stringWithFormat:@"%d",self.count];
    NSString *tmp2= [NSString stringWithFormat:@"%d",self.count_right];
    NSString *result=[NSString stringWithFormat:@"%@ %@ %@",tmp2,@"/",tmp1];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Result" message:result delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)WordInput:(id)sender
{
    //
}
- (IBAction)Go:(id)sender {
}
@end
