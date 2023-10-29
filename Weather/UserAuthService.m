//
//  UserService.m
//  Weather
//
//  Created by Rahul Lokhande on 26/09/23.
//


#import "UserAuthService.h"

@implementation UserAuthService

- (instancetype)init {
    self = [super init];
    if (self) {
        _auth = [FIRAuth auth];
    }
    return self;
}
- (void)registerUser:(User *)user
          completion:(void (^)(NSString *userID, NSError *error))completion {
    
    // Register user with Firebase Authentication
    NSLog(@" password %@ ",user.password);
    [_auth createUserWithEmail:user.email password:user.password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!authResult.user) {
            NSError *noUserError = [NSError errorWithDomain:@"com.weather" code:500 userInfo:@{NSLocalizedDescriptionKey: @"Registration succeeded but no user returned."}];
            completion(nil, noUserError);
            return;
        }
        completion(authResult.user.uid,nil);
        
        
    }];
}

- (void)loginWithEmail:(NSString *)email password:(NSString *)password  completion:(void (^)(NSString *uid, NSError *error))completion {
    
    [_auth signInWithEmail:email password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        completion(authResult.user.uid,nil);
        
    }];
}

@end
