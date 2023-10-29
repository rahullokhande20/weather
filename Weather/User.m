//
//  User.m
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//


#import "User.h"

@implementation User


- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        
        _email = dict[@"email"];
        _displayName = dict[@"username"];
        _bio = dict[@"bio"];
    }
    return self;
}

- (instancetype)initWithEmail:(NSString *)email
                     password:(NSString *)password
              confirmPassword:(NSString *)confirmPassword
                  displayName:(NSString *)displayName
                          bio:(NSString *)bio
                        image:(UIImage *)image {
    self = [super init];
    if (self) {
        _email = email;
        _password = password;
        _confirmPassword = confirmPassword;
        _displayName = displayName;
        _bio = bio;
        _image = image;
    }
    return self;
}

@end
