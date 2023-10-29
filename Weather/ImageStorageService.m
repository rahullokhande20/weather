//
//  ImageStorageService.m
//  Weather
//
//  Created by Rahul Lokhande on 26/09/23.
//

#import "ImageStorageService.h"


@implementation ImageStorageService
- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize the default Firebase services
    
        
    }
    return self;
}
- (void)uploadImage:(UIImage *)image forUserID:(NSString *)userID completion:(void (^)(NSURL *url, NSError *error))completion; {
    
    // Convert UIImage to data for uploading
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    if (!imageData) {
        NSError *conversionError = [NSError errorWithDomain:@"com.weather" code:500 userInfo:@{NSLocalizedDescriptionKey: @"Failed to convert image to data."}];
        completion(nil, conversionError);
        return;
    }
    
    FIRStorageReference *storageRef = [[FIRStorage storage].reference child:[NSString stringWithFormat:@"userImages/%@.jpg", userID]];
    
    // Upload the image
    [storageRef putData:imageData metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        // Get the download URL for the image
        [storageRef downloadURLWithCompletion:^(NSURL *URL, NSError *error) {
            if (error) {
                completion(nil, error);
                return;
            }
            completion(URL, nil);
            
        }];
    }];
}

-(void)getImageFromUid:(NSString *) uid
            completion:(void (^)( UIImage *profileImage, NSError *error))completion{
    FIRStorageReference *imageRef = [[FIRStorage storage].reference child:[NSString stringWithFormat:@"userImages/%@.jpg", uid]];
    
    [imageRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (error){
            completion(nil,error);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completion(image, nil);
    }];
}


@end
