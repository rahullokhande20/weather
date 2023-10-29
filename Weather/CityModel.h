//
//  CityModel.h
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//


#import <Foundation/Foundation.h>
#import "JSONModel/JSONModel.h"

@class WCityElement;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces
//@protocol WCityElement;
@interface WCityElement : JSONModel
@property (nonatomic, copy)           NSString *name;
//@property (nonatomic, nullable, copy) NSDictionary<NSString *, NSString *> *localNames;
@property (nonatomic, copy)           NSString *lat;
@property (nonatomic, copy)           NSString *lon;
@property (nonatomic, copy)           NSString *country;
@property (nonatomic, copy)           NSString *state;
@end


@interface WTCity : JSONModel
@property (nonatomic, strong) NSArray<WCityElement *> *city;
@end

NS_ASSUME_NONNULL_END
