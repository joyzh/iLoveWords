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
- (IBAction)WordInput:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *inputWord;
@property (strong, nonatomic) IBOutlet UILabel *DownTime;
@property float downtime;
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

@end
