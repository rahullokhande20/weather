//
//  ClimateCell.h
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClimateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *temperature;

@end

NS_ASSUME_NONNULL_END
