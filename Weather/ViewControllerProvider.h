//
//  ViewControllerProvider.h
//  Weather
//
//  Created by Rahul Lokhande on 02/10/23.
//
#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import "RegisterViewController.h"
#import "DetailsViewController.h"

@interface ViewControllerProvider : NSObject
+ (UIViewController *)getRegisterViewController;
+ (UIViewController *)getProfileViewControllerFromUser:(User *) user;
+ (DetailsViewController *)getDetailsViewControllerFromItem:(WList *) item
                                                       city:(NSString *)city;
@end


