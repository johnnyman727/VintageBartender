//
//  VBLoginScreenViewController.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 6/20/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBLoginScreenViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *bartenderNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *bartenderPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *barNameTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitCredentialsButton;

@end
