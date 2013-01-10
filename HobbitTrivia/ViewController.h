//
//  ViewController.h
//  HobbitQuiz
//
//  Created by James Rutherford on 2013-01-07.
//  Copyright (c) 2013 Braxio Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;

@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UIImageView *WheelImage;
@property (weak, nonatomic) IBOutlet UIButton *SpinButton;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

- (IBAction)SpinButtonTouch:(id)sender;
- (IBAction)SpinButtonTouchDown:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel1;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel2;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel3;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel4;

@end
