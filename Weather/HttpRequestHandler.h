//
//  HttpRequestHandler.h
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import <Foundation/Foundation.h>
#import "WClimate.h"

@protocol HttpRequestHandlerProtocol <NSObject>

- (void)getCoordinatesFromCityName:(NSString *)cityName completion:(void(^)(NSString *latitude, NSString *longitude, NSError *error))completion;
- (void)getWeatherFromCoordinatesWithLatitude:(NSString *)latitude longitude:(NSString *)longitude completion:(void(^)(WClimateModel *climate, NSError *error))completion;

@end

NS_ASSUME_NONNULL_BEGIN


@interface HttpRequestHandler : NSObject  <HttpRequestHandlerProtocol>

@end

NS_ASSUME_NONNULL_END
