//
//  ViewController.h
//  Spots
//
//  Created by Thiruvengadam Krishnasamy on 17/07/14.
//  Copyright (c) 2014 Thiruvengadam Krishnasamy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
- (IBAction)loginBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
- (IBAction)cancelBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *signupBtn;
- (IBAction)signupBtn:(id)sender;

@end
