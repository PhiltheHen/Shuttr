//
//  SignInViewController.h
//  Shuttr
//
//  Created by Philip Henson on 10/25/15.
//  Copyright © 2015 MMInstaGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignInDelegate <NSObject>

- (void)cancelButtonPressedFromSignIn:(id)sender;

@end

@interface SignInViewController : UIViewController
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@property (weak, nonatomic) id <SignInDelegate> delegate;

@end