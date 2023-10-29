//
//  User.h
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//
// User.h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *confirmPassword;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) UIImage *image;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithEmail:(NSString *)email
                     password:(NSString *)password
              confirmPassword:(NSString *)confirmPassword
                  displayName:(NSString *)displayName
                          bio:(NSString *)bio
                        image:(UIImage *)image;

@end
