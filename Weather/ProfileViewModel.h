//
//  ProfileViewModel.h
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "HttpRequestHandler.h"
#import "WClimate.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewModel : NSObject
- (instancetype)init;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) id<HttpRequestHandlerProtocol> requestHandler;
- (instancetype)initWithRequestService:(id<HttpRequestHandlerProtocol>)requestHandler;
-(void)getWeatherFromCity:(NSString *) city
               completion: (void (^)(BOOL success, NSError *error))completion;
@property (nonatomic, strong) WClimateModel *climate;
@end

NS_ASSUME_NONNULL_END
