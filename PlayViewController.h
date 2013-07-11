//
//  PlayViewController.h
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController


//时间驱动器
@property (strong,nonatomic) NSTimer *timer;
-(void) updateLabel;//时间更新函数
@property Boolean tag;
@property float wordtime;//单词显示的时间

- (IBAction)Ground:(id)sender;
- (IBAction)return:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *WordShow;
@property  NSString *curWord;//current showing word

- (IBAction)WordInput:(id)sender;//finish inputing
@property (strong, nonatomic) IBOutlet UITextField *inputWord;

@property (strong, nonatomic) IBOutlet UILabel *DownTime;
@property float downtime;//total time
@property (retain,nonatomic) NSString *timestr;

@property (strong, nonatomic) IBOutlet UILabel *resultJudge;


@property (retain,nonatomic)NSArray *list;//dataFilePath
- (NSString *)dataFilePath;

@property (strong, nonatomic) IBOutlet UIButton *btnGo;

- (IBAction)Go:(id)sender;

-(void)showDownTime;
-(NSString *)getCurrentTime;
@property  NSString *beginTime;//time started.

-(void)showWord;
-(void)hideWord;

-(Boolean)isWordTrue:(NSString *)wordtmp;
-(void)showResult;
@property int count;//number of the showed words
@property int count_right;
@property int count_wrong;

@end
