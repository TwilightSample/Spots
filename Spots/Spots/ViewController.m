//
//  ViewController.m
//  Spots
//
//  Created by Thiruvengadam Krishnasamy on 17/07/14.
//  Copyright (c) 2014 Thiruvengadam Krishnasamy. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSString *objectID;


@end

@implementation ViewController
@synthesize usernameTxt,passwordTxt,loginBtn,signupBtn,objectID,logoImage,forgotPassword;


- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg640x960.png"]];
    self.view.backgroundColor = background;
    UIImage* image = [UIImage imageNamed:@"logo@2x-1.png"];
    UIColor *textBg = [UIColor colorWithHex:@"#d6eea5" alpha:1.0];
    UIColor *textColor = [UIColor colorWithHex:@"#a8b58d" alpha:1.0];
    UIColor *buttonBg = [UIColor colorWithHex:@"#7a9b38" alpha:1.0];
    
    [logoImage setImage:image];
    usernameTxt.backgroundColor = textBg;
    passwordTxt.backgroundColor = textBg;
    usernameTxt.textColor = textColor;
    
    passwordTxt.textColor = textColor;
    
    
    loginBtn.backgroundColor = buttonBg;
    loginBtn.layer.cornerRadius = 3;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    signupBtn.backgroundColor = buttonBg;
    signupBtn.layer.cornerRadius = 3;
    [signupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    signupBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    forgotPassword.backgroundColor = [UIColor clearColor];
    [forgotPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [self.usernameTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [usernameTxt endEditing:YES];
    [passwordTxt endEditing:YES];
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtn:(id)sender {
    NSPredicate *loginPredicate = [NSPredicate predicateWithFormat:@"username == %@ AND password == %@",usernameTxt.text,passwordTxt.text];
    
    PFQuery *userquery = [PFQuery queryWithClassName:@"user_details" predicate:loginPredicate];
    [userquery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        if (!object) {
            NSLog(@"Error!");
        }
        else{
            NSLog(@"Success !!!");
        }
    }];
    
}

- (IBAction)signupBtn:(id)sender {
    
    RegisterViewController *view = (RegisterViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self presentViewController:view animated:YES completion:nil];
    
    
    
    
}
- (IBAction)forgotPassword:(id)sender {
}
@end
