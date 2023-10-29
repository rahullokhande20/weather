//
//  DetailsViewModel.h
//  Weather
//
//  Created by Rahul Lokhande on 02/10/23.
//

#import <Foundation/Foundation.h>
#import "WClimate.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewModel : NSObject
@property (nonatomic, strong) WList *item;
@property (nonatomic, strong) NSString *city;
@end

NS_ASSUME_NONNULL_END
