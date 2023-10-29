//
//  ProfileViewController.h
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import <UIKit/UIKit.h>
#import "ProfileViewModel.h"
#import "ClimateCell.h"
#import "WClimate.h"
#import "ViewControllerProvider.h"
#import "DetailsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>;
@property (nonatomic, strong) ProfileViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITextField *cityName;

@end

NS_ASSUME_NONNULL_END
