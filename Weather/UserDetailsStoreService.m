//
//  UserDetailsStoreService.m
//  Weather
//
//  Created by Rahul Lokhande on 02/10/23.
//

#import "UserDetailsStoreService.h"

@implementation UserDetailsStoreService
-(void)addDetails:(NSString *)documentPath
             user:(User *) user
       completion:(void (^)(BOOL success, NSError *error))completion {
    FIRFirestore *firestore = [FIRFirestore firestore];
    FIRDocumentReference *docRef = [[firestore collectionWithPath:@"users"] documentWithPath:documentPath];
    //documentPath = authResult.user.uid
    NSDictionary *userData = @{
        @"username": user.displayName,
        @"bio": user.bio,
        @"email": user.email
    };
    
    [docRef setData:userData completion:^(NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        completion(YES, nil);
    }];
}
-(void)getDetailsFromUid:(NSString *)documentPath
              completion:(void (^)(User *user, NSError *error))completion{
    FIRFirestore *firestore = [FIRFirestore firestore];
    
    FIRDocumentReference *userRef =[[firestore collectionWithPath:@"users"] documentWithPath:documentPath];
    
    [userRef getDocumentWithCompletion:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        User *user = [[User alloc] initWithDictionary: snapshot.data];
        completion(user,nil);
        // Fetch profile image from Firebase Storage
        
    }];
}

@end
