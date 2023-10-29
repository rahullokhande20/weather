//
//  LoginViewModel.m
//  Weather
//
//  Created by Rahul Lokhande on 23/09/23.
//

#import "LoginViewModel.h"
@import FirebaseAuth;
@import FirebaseCore;
@import FirebaseStorage;
#import "User.h"

@implementation LoginViewModel
- (instancetype)initWithAuthService:(id<UserAuthServiceProtocol>)authService
                imageStorageService:(id<ImageStorageServiceProtocol>)imageStorageService
                  userDetailService:(id<UserDetailsStoreServiceProtocol>)userDetailService{
    if (self = [super init]) {
        _authService = authService;
        _imageStorageService = imageStorageService;
        _userDetailService = userDetailService;
    }
    return self;
}
- (void)loginWithEmail:(NSString *)email password:(NSString *)password  completion:(void (^)(User *user, NSError *error))completion {
    [self.authService loginWithEmail:email password:password completion:^(NSString *uid, NSError *error) {
        if (error){
            completion(nil, error);
            return;
        }
        [self.userDetailService getDetailsFromUid:uid completion:^(User * _Nonnull user, NSError * _Nonnull error) {
            if (error){
                completion(nil,error);
                return;
            }
            [self.imageStorageService getImageFromUid:uid completion:^(UIImage * _Nonnull profileImage, NSError * _Nonnull error) {
                if (error){
                    completion(user,nil);
                    return;
                }
                user.image = profileImage;
                completion(user,nil);
            }];
        }];
        
    }];
}


@end
