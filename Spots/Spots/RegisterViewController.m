//
//  RegisterViewController.m
//  Spots
//
//  Created by TwilightSoftwares on 17/07/14.
//  Copyright (c) 2014 Thiruvengadam Krishnasamy. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>
#import "kCommon.h"
#import "Base64.h"
@interface RegisterViewController ()
{
    BOOL isToRegiser;
}
@end

@implementation RegisterViewController
@synthesize useridTxtField,userImg,usernameTxtField,emailidTxtField,passwordTxtField,confirmpwdTextField,phonenumTxtField,keyboardToolbar,scroller,imagePicker,chosenImage,buttonChange;

CGPoint svos;


UIBarButtonItem *previousButton;
UIBarButtonItem *nextButton;
UIBarButtonItem *extraSpace;
UIBarButtonItem *done;

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
    // Do any additional setup after loading the view.
    keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0,320,50)];
    
    //keyboardToolbar.tintColor=[UIColor blackColor];
    
    
    
    keyboardToolbar.tintColor = [UIColor colorWithRed:0.15 green:0.35 blue:0.45 alpha:0.6];
    // keyboardToolbar.translucent = UIBarStyleBlackTranslucent;
    previousButton = [[UIBarButtonItem alloc] initWithTitle:@"previous"
                                                      style:UIBarButtonItemStyleBordered
                                                     target:self
                                                     action:@selector(previousField)];
    nextButton = [[UIBarButtonItem alloc] initWithTitle:@"next"
                                                  style:UIBarButtonItemStyleBordered
                                                 target:self
                                                 action:@selector(nextFieldJson)];
    
    extraSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:nil action:nil];
    
    done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(resignKeyboardJson:)];
    
    
    [keyboardToolbar setItems:[[NSArray alloc] initWithObjects:previousButton,nextButton,extraSpace, done, nil]];
    [keyboardToolbar sizeToFit];
    useridTxtField.inputAccessoryView = keyboardToolbar;
    usernameTxtField.inputAccessoryView  = keyboardToolbar;
    emailidTxtField.inputAccessoryView = keyboardToolbar;
    phonenumTxtField.inputAccessoryView = keyboardToolbar;
    passwordTxtField.inputAccessoryView = keyboardToolbar;
    confirmpwdTextField.inputAccessoryView = keyboardToolbar;
     [emailidTxtField addTarget:self action:@selector(txtfieldDidChange) forControlEvents:UIControlEventEditingChanged];
    
    userImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectCamera)];
    [userImg addGestureRecognizer:tap];
    isToRegiser = NO;

}
-(void) txtfieldDidChange
{
    [buttonChange setTitle:@"Check Availability" forState:UIControlStateNormal];
    isToRegiser = NO;
}
- (void)viewDidLayoutSubviews {
    [self.scroller setContentSize:CGSizeMake(320, 650)];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    svos = scroller.contentOffset;
    CGPoint pt;
    CGRect rc = [textField bounds];
    rc = [textField convertRect:rc toView:scroller];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 20;
    [scroller setContentOffset:pt animated:YES];
    
}
-(void)selectCamera
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Camera",@"Gallery", nil];
    [alert show];
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [myAlertView show];
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imagePicker = [[UIImagePickerController alloc]init];
                self.imagePicker.delegate = self;
                [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self presentViewController:self.imagePicker animated:YES completion:nil];
            });
            
        }
    }
    if (buttonIndex == 2) {
        dispatch_async(dispatch_get_main_queue(), ^{
        self.imagePicker = [[UIImagePickerController alloc]init];
        self.imagePicker.delegate = self;
        [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:self.imagePicker animated:YES completion:nil];
            });
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    dispatch_async(dispatch_get_main_queue(), ^{
    self.chosenImage = info[UIImagePickerControllerOriginalImage];
    [userImg setImage:self.chosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
    });
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void) previousField
{
    if ([usernameTxtField isFirstResponder]) {
        [useridTxtField becomeFirstResponder];
        
    }
    else if ([emailidTxtField isFirstResponder]) {
        [usernameTxtField becomeFirstResponder];
    }
    
    else if ([phonenumTxtField isFirstResponder]) {
        [emailidTxtField becomeFirstResponder];
    }
    else if ([passwordTxtField isFirstResponder]) {
        [phonenumTxtField becomeFirstResponder];
    }
    else if ([confirmpwdTextField isFirstResponder]) {
        [passwordTxtField becomeFirstResponder];
    }
}


-(void)nextFieldJson
{
    if ([useridTxtField isFirstResponder]) {
        [usernameTxtField becomeFirstResponder];
    }
    else if ([usernameTxtField isFirstResponder]) {
        [emailidTxtField becomeFirstResponder];
    }
    
    else if ([emailidTxtField isFirstResponder]) {
        [phonenumTxtField becomeFirstResponder];
    }
    else if ([phonenumTxtField isFirstResponder]) {
        [passwordTxtField becomeFirstResponder];
    }
    else if ([passwordTxtField isFirstResponder]) {
        [confirmpwdTextField becomeFirstResponder];
    }
}

-(void) resignKeyboardJson:(id)sender
{
    [self.view endEditing:YES];
    [scroller setContentOffset:svos animated:YES];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)exit{
    [exit resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)chkAvailability:(id)sender {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if (useridTxtField.text.length>0 &&usernameTxtField.text.length>0 && emailidTxtField.text.length>0 &&phonenumTxtField.text.length>0&& passwordTxtField.text.length>0 &&confirmpwdTextField.text.length>0 &&([passwordTxtField.text isEqualToString:confirmpwdTextField.text]) && passwordTxtField.text.length>5 && passwordTxtField.text.length < 20)
        
    {
        //  if ([[emailidTextField.text componentsSeparatedByString:@"@"] count] > 1) {
        if ([emailTest evaluateWithObject:emailidTxtField.text] == YES){
          [kCommon showLoader:self withText:@"Loading..."];
            if(isToRegiser)
            {
                [self registerNow];
            }else
            {
                PFQuery *query = [PFQuery queryWithClassName:@"user_details"];
                
                [query whereKey:@"emailid" equalTo:emailidTxtField.text];
                [query getFirstObjectInBackgroundWithBlock:^(PFObject *gameScore, NSError *error) {
                    
                    [kCommon hideLoader];
                    if(!gameScore)
                    {
                        [buttonChange setTitle:@"Signup" forState:UIControlStateNormal];
                        
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Available!!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                        [alert show];
                        isToRegiser = YES;
                    }else{
                        
                        //[query whereKey:@"Image" equalTo:self.image.image];
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Email already registered!!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                }];
            }
        }
        else
        {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Enter Proper EmailID " message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Password not match" message:@"Password should be 6 to 20 character length" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)registerNow
{
    BOOL success = YES;
    
    PFQuery *query = [PFQuery queryWithClassName:@"user_details"];
  //  [query orderByDescending:@"userid"];
  //  query.limit = 1;  //Limiting One Result Max Value from Descending Order
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *gameScore, NSError *error) {
        [kCommon hideLoader];
        if(!gameScore)
        {
            
        }else{
            
            NSData *data = UIImageJPEGRepresentation(userImg.image, 1.0f);
            NSString *str = [Base64 encode:data];
            
        //   int phonenum = [[gameScore objectForKey:@"phoneno"] intValue];
          //  NSLog(@"User id %d",phonenum);
            PFObject *obj = [PFObject objectWithClassName:@"user_details"];
            
        //   int setphonenum = phonenum;
            
           // NSLog(@"User increament %d",userid_increament);
         //  NSString *userid = [NSString stringWithFormat:@"%d",setphonenum];
            
           // [obj setObject:[NSNumber numberWithInt:[userid intValue]] forKey:@"User_id"];
            [obj setObject:useridTxtField.text forKey:@"userid"];
            [obj setObject:usernameTxtField.text forKey:@"username"];
            [obj setObject:emailidTxtField.text forKey:@"emailid"];
            [obj setObject:phonenumTxtField.text forKey:@"phoneno"];
            [obj setObject:passwordTxtField.text forKey:@"password"];
            [obj setObject:confirmpwdTextField.text forKey:@"password"];
            [obj setObject:str forKey:@"userimage"];
            [obj saveInBackground];
        }
        if (success) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Registered Successfully!!" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}
@end
