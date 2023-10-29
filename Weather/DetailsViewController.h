//
//  DetailsViewController.h
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import <UIKit/UIKit.h>
#import "DetailsViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *sunrise;
@property (weak, nonatomic) IBOutlet UILabel *sunset;
@property (weak, nonatomic) IBOutlet UILabel *morning;
@property (weak, nonatomic) IBOutlet UILabel *morningTemp;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *dayTemp;
@property (weak, nonatomic) IBOutlet UILabel *evening;
@property (weak, nonatomic) IBOutlet UILabel *eveningTemp;
@property (weak, nonatomic) IBOutlet UILabel *night;
@property (weak, nonatomic) IBOutlet UILabel *nightTemp;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *clouds;
@property (weak, nonatomic) IBOutlet UILabel *pressure;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (nonatomic, strong) DetailsViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
