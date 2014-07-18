//
//  RegisterViewController.h
//  Spots
//
//  Created by TwilightSoftwares on 17/07/14.
//  Copyright (c) 2014 Thiruvengadam Krishnasamy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ALPHA                   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define NUMERIC                 @"1234567890"
#define ALPHA_NUMERIC           ALPHA NUMERIC
@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate>
@property (strong,nonatomic) UIImage *chosenImage;
@property (strong,nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UIImageView *userImg;
@property (strong, nonatomic) IBOutlet UITextField *usernameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *emailidTxtField;
@property (strong, nonatomic) IBOutlet UITextField *phonenumTxtField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxtField;
@property (strong, nonatomic) IBOutlet UITextField *confirmpwdTextField;

@property (strong, nonatomic) IBOutlet UIToolbar *keyboardToolbar;

- (IBAction)chkAvailability:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonChange;


@end
