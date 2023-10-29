//
//  LoginViewModel.h
//  Weather
//
//  Created by Rahul Lokhande on 23/09/23.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "ImageStorageService.h"
#import "UserAuthService.h"
#import "UserDetailsStoreService.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject
- (instancetype)initWithAuthService:(id<UserAuthServiceProtocol>)authService
                imageStorageService:(id<ImageStorageServiceProtocol>)imageStorageService
                  userDetailService:(id<UserDetailsStoreServiceProtocol>) userDetailService;

- (void)loginWithEmail:(NSString *)email password:(NSString *)password             completion:(void (^)(User *user, NSError *error))completion;


@property (nonatomic, strong) id<UserAuthServiceProtocol> authService;
@property (nonatomic, strong) id<ImageStorageServiceProtocol> imageStorageService;
@property (nonatomic, strong) id<UserDetailsStoreServiceProtocol> userDetailService;


@end

NS_ASSUME_NONNULL_END
