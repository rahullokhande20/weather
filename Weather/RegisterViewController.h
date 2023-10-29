//
//  RegisterViewController.h
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import <UIKit/UIKit.h>
#import "RegisterViewModel.h"
#import "ViewControllerProvider.h"
#import "ProfileViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface RegisterViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) RegisterViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
