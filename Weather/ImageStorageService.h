//
//  ImageStorageService.h
//  Weather
//
//  Created by Rahul Lokhande on 26/09/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@import FirebaseStorage;
#import "User.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ImageStorageServiceProtocol <NSObject>

- (void)uploadImage:(UIImage *)image forUserID:(NSString *)userID completion:(void (^)(NSURL *url, NSError *error))completion;
-(void)getImageFromUid:(NSString *) uid
            completion:(void (^)( UIImage *profileImage, NSError *error))completion;

@end

@interface ImageStorageService : NSObject  <ImageStorageServiceProtocol>

-(void)getImageFromUid:(NSString *) uid
            completion:(void (^)( UIImage *profileImage, NSError *error))completion;
- (void)uploadImage:(UIImage *)image forUserID:(NSString *)userID completion:(void (^)(NSURL *url, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
