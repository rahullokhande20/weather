//
//  DetailsViewController.m
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import "DetailsViewController.h"
#import "SDWebImage/SDWebImage.h"
#import "URLConstants.h"
#import "UIKit/UIKit.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    // Do any additional setup after loading the view.
    
}
-(void)setup{
    
    WList *item = self.viewModel.item;
    Weather *weather = [item.weather firstObject];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ on %@",self.viewModel.city, item.formattedDate];
    self.sunrise.text = [NSString stringWithFormat:@"Sunrise: %@",  item.formattedSunrise];
    self.sunset.text =  [NSString stringWithFormat:@"Sunset: %@",  item.formattedSunset];
    self.desc.text = weather.desc;
    self.morningTemp.text = [NSString stringWithFormat:@"%.2f°C",  item.temp.morn];
    self.dayTemp.text = [NSString stringWithFormat:@"%.2f°C",  item.temp.day];
    self.eveningTemp.text = [NSString stringWithFormat:@"%.2f°C",  item.temp.eve];
    self.nightTemp.text = [NSString stringWithFormat:@"%.2f°C",  item.temp.night];
    
    self.humidity.text = [NSString stringWithFormat:@"Humidity: %ld %%",  item.humidity];
    self.clouds.text =  [NSString stringWithFormat:@"Clouds: %ld %%",  item.clouds];
    self.pressure.text = [NSString stringWithFormat:@"Pressure: %ld hPa",  item.pressure];
    self.windSpeed.text =  [NSString stringWithFormat:@"Wind Speed: %.2f m/s",  item.speed];
    NSString *imageUrl = [NSString stringWithFormat:kWeatherIconEndpoint, weather.icon];
    NSLog(@"icon %@",imageUrl);
    [self.icon sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                 placeholderImage:[UIImage systemImageNamed:@"w.circle"]];
    
}


@end
