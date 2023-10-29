//
//  RegisterViewModel.h
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import <UIKit/UIKit.h>
#import "UserAuthService.h"
#import "ImageStorageService.h"
#import "UserDetailsStoreService.h"

NS_ASSUME_NONNULL_BEGIN
@interface RegisterViewModel : NSObject
// userService is used for responsible or registration of user
@property (nonatomic, strong) id<UserAuthServiceProtocol> userService;

// imageStorageService is responsible for storing and retrieving user image from firebase cloud
@property (nonatomic, strong) id<ImageStorageServiceProtocol> imageStorageService;

// userDetailService is responsible for adding and retrieving user details
@property (nonatomic, strong) id<UserDetailsStoreServiceProtocol> userDetailService;

@property (nonatomic, strong) User *user;
- (instancetype)initWithUserService:(id<UserAuthServiceProtocol>)userService
                imageStorageService:(id<ImageStorageServiceProtocol>)imageStorageService
                  userDetailService:(id<UserDetailsStoreServiceProtocol>) userDetailService;
- (void)registerUser:(void (^)(BOOL success, NSError *error))completion;
- (BOOL)isValidCredentials;
@end

NS_ASSUME_NONNULL_END
