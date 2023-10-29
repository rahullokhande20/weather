//
//  WClimet.h
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//



#import <Foundation/Foundation.h>
#import "JSONModel/JSONModel.h"

@class WClimateModel;
@class WCity;
@class WCoord;
@class WList;
@class WFeelsLike;
@class WTemp;
@class Weather;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces


@protocol Weather;
@interface Weather : JSONModel
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *main;
@property (nonatomic, copy)   NSString *desc;
@property (nonatomic, copy)   NSString *icon;
@end

@protocol WList;
@interface WList : JSONModel
@property (nonatomic, strong) NSDate *dt;
@property (nonatomic, readonly) NSString *formattedDate;
@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, readonly) NSString *formattedSunrise;
@property (nonatomic, strong) NSDate *sunset;
@property (nonatomic, readonly) NSString *formattedSunset;
@property (nonatomic, strong) WTemp *temp;
@property (nonatomic, strong) WFeelsLike *feelsLike;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, copy)   NSArray<Weather> *weather;
@property (nonatomic, assign) double speed;
@property (nonatomic, assign) NSInteger deg;
@property (nonatomic, assign) double gust;
@property (nonatomic, assign) NSInteger clouds;
@property (nonatomic, assign) double pop;
@property (nonatomic, strong)  NSNumber<Optional>* rain;
@end

@interface WClimateModel : JSONModel
@property (nonatomic, strong) WCity *city;
@property (nonatomic, copy)   NSString *cod;
@property (nonatomic, assign) double message;
@property (nonatomic, assign) NSInteger cnt;
@property (nonatomic, copy)   NSArray<WList> *list;
@end

@interface WCity : JSONModel
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) WCoord *coord;
@property (nonatomic, copy)   NSString *country;
@property (nonatomic, assign) NSInteger population;
@property (nonatomic, assign) NSInteger timezone;
@end

@interface WCoord : JSONModel
@property (nonatomic, assign) double lon;
@property (nonatomic, assign) double lat;
@end



@interface WFeelsLike : JSONModel
@property (nonatomic, assign) double day;
@property (nonatomic, assign) double night;
@property (nonatomic, assign) double eve;
@property (nonatomic, assign) double morn;
@end

@interface WTemp : JSONModel
@property (nonatomic, assign) double day;
@property (nonatomic, assign) double min;
@property (nonatomic, assign) double max;
@property (nonatomic, assign) double night;
@property (nonatomic, assign) double eve;
@property (nonatomic, assign) double morn;
@end


NS_ASSUME_NONNULL_END
