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

@end
