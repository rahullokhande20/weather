//
//  UserService.h
//  Weather
//
//  Created by Rahul Lokhande on 26/09/23.
//


#import <Foundation/Foundation.h>
#import <FirebaseAuth/FirebaseAuth.h>
#import "User.h"

@protocol UserAuthServiceProtocol <NSObject>
- (void)loginWithEmail:(NSString *)email password:(NSString *)password
            completion:(void (^)(NSString *uid, NSError *error))completion;
- (void)registerUser:(User *)user
          completion:(void (^)(NSString *userID, NSError *error))completion;

@end

@interface UserAuthService : NSObject <UserAuthServiceProtocol>

@property (nonatomic, strong) FIRAuth *auth;
- (instancetype)init;
- (void)loginWithEmail:(NSString *)email password:(NSString *)password
            completion:(void (^)(NSString *uid, NSError *error))completion;
- (void)registerWithEmail:(NSString *)email
                 password:(NSString *)password
               completion:(void (^)(NSString *userID, NSError *error))completion;
@end
