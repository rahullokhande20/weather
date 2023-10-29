//
//  RegisterViewModel.m
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import "RegisterViewModel.h"
@import FirebaseAuth;
@import FirebaseFirestore;
#import "User.h"
#import "UserAuthService.h"
@implementation RegisterViewModel

- (instancetype)initWithUserService:(id<UserAuthServiceProtocol>)userService
                imageStorageService:(id<ImageStorageServiceProtocol>)imageStorageService
                  userDetailService:(id<UserDetailsStoreServiceProtocol>)userDetailService{
    self = [super init];
    if (self) {
        _userService = userService;
        _imageStorageService = imageStorageService;
        _userDetailService = userDetailService;
        _user = [[User alloc] init];
    }
    return self;
}


- (BOOL)isValidCredentials {
    NSLog(@"RegisterViewModel,isValidCredentials: %@",self.user.displayName);
    return self.user.displayName.length > 0 && self.user.password.length > 0;
}

- (void)registerUser:(void (^)(BOOL success, NSError *error))completion {
    [self.userService registerUser:self.user completion:^(NSString *userID, NSError *error) {
        if (error) {
            completion(NO, error);
            return;
        }
        __weak typeof(self) weakSelf = self;
        [self.userDetailService addDetails:userID user:weakSelf.user completion:^(BOOL success, NSError *error) {
            if (success){
                
                
                [weakSelf.imageStorageService uploadImage:weakSelf.user.image forUserID:userID completion:^(NSURL *url, NSError *error) {
                    if (error) {
                        completion(NO, error);
                        return;
                    }
                    completion(YES, nil);
                }];
            }
        }];
        
    }];
}

@end

