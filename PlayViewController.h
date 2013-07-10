//
//  PlayViewController.h
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController
- (IBAction)return:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *WordShow;
@property  NSString *curWord;//current showing word
- (IBAction)WordInput:(id)sender;//finish inputing
@property (strong, nonatomic) IBOutlet UITextField *inputWord;
@property (strong, nonatomic) IBOutlet UILabel *DownTime;
@property float downtime;//total time
@property (retain,nonatomic) NSString *timestr;

@property (retain,nonatomic)NSArray *list;//dataFilePath
- (NSString *)dataFilePath;


- (IBAction)Go:(id)sender;

-(void)showDownTime;
-(NSString *)getCurrentTime;

-(void)showWord;
-(void)hideWord;

-(Boolean)isWordTrue:(NSString *)wordtmp;
-(void)showResult;
@property int count;//number of the showed words
@property int count_right;
@property int count_wrong;

@end
