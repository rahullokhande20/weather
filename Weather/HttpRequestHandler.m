//
//  HttpRequestHandler.m
//  Weather
//
//  Created by Rahul Lokhande on 27/09/23.
//

#import "HttpRequestHandler.h"
#import "URLConstants.h"
#import "CityModel.h"
#import "WClimate.h"

@implementation HttpRequestHandler
- (void)getCoordinatesFromCityName:(NSString *)cityName completion:(void(^)(NSString *latitude, NSString *longitude, NSError *error))completion {
    NSString *urlString = [NSString stringWithFormat:kCoordinateURLString, kBaseURLString, [cityName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]],apiKey];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url %@ ",urlString);
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, nil, error);
            return;
        }
        
     
        NSArray<WCityElement *> *cities = [WCityElement arrayOfModelsFromData:data error:&error];

        if (error) {
            completion(nil,nil, error);
            NSLog(@"error %@",error.localizedDescription);
            return;
        }
        NSLog(@"cities %@",cities);
        WCityElement *city = [cities firstObject];
       
        completion(city.lat, city.lon, nil);
        
    }];
    
    [dataTask resume];
    
}
- (void)getWeatherFromCoordinatesWithLatitude:(NSString *)latitude longitude:(NSString *)longitude completion:(void(^)(WClimateModel *climate, NSError *error))completion {
    // Here, you would typically make a network request to a weather service using the provided latitude and longitude.
    // For this example, let's simulate it.
    // 22.5726° N, 88.3639° E
    NSString *urlString = [NSString stringWithFormat:kWeatherURLEndpoint, kBaseURLString, latitude,longitude,apiKey];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url %@ ",urlString);
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil,error);
            NSLog(@"error %@",error);
            return;
        }
        
        WClimateModel *climate = [[WClimateModel alloc] initWithData:data error:&error];
        
        if ( error) {
            completion(nil,error);
            NSLog(@"error %@",error);
            return;
        }
        
        NSLog(@"cmimate %@",climate);
        completion(climate,nil);
        
    }];
    
    [dataTask resume];
    
}
@end
