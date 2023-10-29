//
//  ProfileViewModel.m
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import "ProfileViewModel.h"

@implementation ProfileViewModel
- (instancetype)initWithRequestService:(id<HttpRequestHandlerProtocol>)requestService{
    self = [super init];
    if (self) {
        _requestHandler = requestService;
    }
    return self;
    
}
-(void)getWeatherFromCity:(NSString *) city
               completion: (void (^)(BOOL success, NSError *error))completion{
    [self.requestHandler getCoordinatesFromCityName:city completion:^(NSString *latitude, NSString *longitude, NSError *error) {
        NSLog(@"coordinates lat= %@, lon =%@",latitude,longitude);
        [self.requestHandler getWeatherFromCoordinatesWithLatitude:latitude longitude:longitude completion:^(WClimateModel *climate, NSError *error) {
            if (!error){
                self.climate = climate;
                completion(YES,nil);
            }else {
                completion(NO,error);
            }
            
        }];
    }];
    
}
@end
