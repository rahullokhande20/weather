//
//  WClimet.m
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import "WClimate.h"

@implementation WClimateModel
@end

@implementation WCity
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"identifier": @"id"
    }];
}
@end

@implementation WCoord
@end

@implementation WList
- (void)setDateWithNSNumber:(NSNumber *)timestamp {
    _dt = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
}
- (void)setSunriseWithNSNumber:(NSNumber *)timestamp {
    _sunrise = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
}
- (void)setSunsetWithNSNumber:(NSNumber *)timestamp {
    _sunset = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
}

+ (JSONKeyMapper *)keyMapper {
    return [JSONKeyMapper mapperForSnakeCase];
}
- (NSString *)formattedDate {
    if (!_dt) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MMM-yyyy"]; // Adjust this to your desired format
    return [formatter stringFromDate:self.dt];
}
- (NSString *)formattedSunrise {
    if (!_sunrise) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"]; // Adjust this to your desired format
    return [formatter stringFromDate:self.sunrise];
}
- (NSString *)formattedSunset {
    if (!_sunset) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"]; // Adjust this to your desired format
    return [formatter stringFromDate:self.sunset];
}
@end

@implementation WFeelsLike
@end

@implementation WTemp
@end

@implementation Weather
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"identifier": @"id",
        @"desc": @"description"
    }];
}
@end
