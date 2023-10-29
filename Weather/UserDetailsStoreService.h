//
//  UserDetailsStoreService.h
//  Weather
//
//  Created by Rahul Lokhande on 02/10/23.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import <FirebaseFirestore/FirebaseFirestore.h>

NS_ASSUME_NONNULL_BEGIN
@protocol UserDetailsStoreServiceProtocol <NSObject>

-(void)addDetails:(NSString *)documentPath
             user:(User *)user
       completion:(void (^)(BOOL success, NSError *error))completion;
-(void)getDetailsFromUid:(NSString *)documentPath
              completion:(void (^)(User *user, NSError *error))completion;

@end

@interface UserDetailsStoreService : NSObject <UserDetailsStoreServiceProtocol>

-(void)addDetails:(NSString *)documentPath
             user:(User *)user
       completion:(void (^)(BOOL success, NSError *error))completion;
-(void)getDetailsFromUid:(NSString *)documentPath
              completion:(void (^)(User *user, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
