//
//  PlayViewController.m
//  iLoveWords
//
//  Created by administrator on 13-7-9.
//  Copyright (c) 2013年 HFUT. All rights reserved.
//

#import "PlayViewController.h"
//#define kFileName @"WordList.plist"

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
    
    //设置时间驱动
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(0.1)target:self  selector:@selector(updateLabel) userInfo:nil repeats:YES];

    
    //initial varibles
    //self.downtime=60.0;
    
    //self.count=0;
    //self.count_right=0;
    //self.count_wrong=0;
    self.tag = 0;
    //self.wordtime = 5.0;
    //initial array
    self.list=[[NSArray alloc]initWithObjects:@"attend",@"account",@"against",@"because",@"between", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//一直执行
-(void) updateLabel{
    if (self.tag) {
        if (self.downtime > 0.1) {
            //显示倒计时
            [self showDownTime];
            if (self.wordtime < 5.0) {
                self.WordShow.text = @"";
                if (self.wordtime < 0.1) {
                    self.wordtime = 8.0;
                    [self showWord];
                }
            }
        
            
        } else {
            self.DownTime.text = @"Time up!";
        
        }

    } else {
        self.DownTime.text = @"Welcome rewiew English words！";
    }
    self.wordtime = self.wordtime - 0.1;        
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

/*
- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return[documentsDirectory stringByAppendingPathComponent:kFileName];
}*/

-(void)showWord
{
    int y = arc4random() % 100;
    int x = y%5;
    //取出list数组中的第x个元素
    self.curWord=[self.list objectAtIndex:x];
    
    self.WordShow.text = [NSString stringWithFormat:@"%@",self.curWord];
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
        self.count_right=self.count_right+1;
        return YES;
    }
    else
    {                
        self.count_wrong=self.count_wrong+1;
        return NO;
    }
    
}

-(void)showResult
{
    NSString *tmp1 = [NSString stringWithFormat:@"%d",self.count];
    NSString *tmp2= [NSString stringWithFormat:@"%d",self.count_right];
    NSString *result=[NSString stringWithFormat:@"正确单词数：%@ /总单词数： %@",tmp2,tmp1];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Result" message:result delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)WordInput:(id)sender
{
    NSString *tmpWord=self.inputWord.text;
    Boolean judgeResult=[self isWordTrue:tmpWord];
    if (judgeResult) {
        //bingo sound
        self.resultJudge.hidden=NO;
        self.resultJudge.text=@"Right!";
    }
    else
   {
        //wrong sound
       self.resultJudge.hidden=NO;
       self.resultJudge.text=@"Wrong!";

   }
    
   NSString *currenTime=[self getCurrentTime];
   float ftCurTime = [currenTime floatValue];
   float ftBegTime = [self.beginTime floatValue];//Caution!

     while((ftCurTime-ftBegTime)<self.downtime)
{
    [self showWord];
    //[self hideWord];
    NSString *tmpWord=self.inputWord.text;
    Boolean judgeResult=[self isWordTrue:tmpWord];
    if (judgeResult) {
        //bingo sound
        self.resultJudge.hidden=NO;
        self.resultJudge.text=@"Right!";
    }
    else
    {
        //wrong sound
        self.resultJudge.hidden=NO;
        self.resultJudge.text=@"Wrong!";
        
    }
    currenTime=[self getCurrentTime];
    ftCurTime = [currenTime floatValue];
}
    
}
- (IBAction)Go:(id)sender
{
   
    self.btnGo.hidden=NO;//hide button Go
     UIButton *btn=(UIButton *) sender;
    if (btn.tag == 0) {
        btn.tag = 1;
        self.downtime = 60.0;
        self.count = 0;
        self.count_right = 0;
        self.wordtime = 8;
    } else {
        btn.tag = 0;
        [self showResult];
    }
    self.tag = btn.tag;
    
    [self showWord];
    //[self hideWord];
    
}
- (IBAction)Ground:(id)sender {
    
    [self.inputWord resignFirstResponder];
    //[self inputWord];
   
    if (self.tag == 0) {
        NSString *tmpWord=self.inputWord.text;
        Boolean judgeResult=[self isWordTrue:tmpWord];
        if (judgeResult) {
            //bingo sound
            self.resultJudge.hidden=NO;
            self.resultJudge.text=@"Right!";
            self.count_right = self.count_right +1;
        }
        else
        {
            //wrong sound
            self.resultJudge.hidden=NO;
            self.resultJudge.text=@"Wrong!";
            
        }
        self.inputWord.text = @"";
        [self showWord];//产生新的随机单词

    }
    
}
@end
