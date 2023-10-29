//
//  ViewControllerProvider.m
//  Weather
//
//  Created by Rahul Lokhande on 02/10/23.
//

#import "ViewControllerProvider.h"

@implementation ViewControllerProvider


+ (RegisterViewController *)getRegisterViewController{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserAuthService *userService = [[UserAuthService alloc] init];
    ImageStorageService *imageService = [[ImageStorageService alloc] init];
    UserDetailsStoreService * userDetailService = [[UserDetailsStoreService alloc]init];
    RegisterViewModel *viewModel = [[RegisterViewModel alloc] initWithUserService:userService imageStorageService:imageService userDetailService:userDetailService];
    RegisterViewController *registerVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    registerVC.viewModel = viewModel;
    return registerVC;
}

+ (DetailsViewController *)getDetailsViewControllerFromItem:(WList *) item
                                                       city:(NSString *)city{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DetailsViewController *detailsVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    detailsVC.viewModel = [[DetailsViewModel alloc] init];
    detailsVC.viewModel.item = item;
    detailsVC.viewModel.city = city;
    return detailsVC;
}
+ (ProfileViewController *)getProfileViewControllerFromUser:(User *) user{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ProfileViewController *profileVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    HttpRequestHandler *requestHandler = [[HttpRequestHandler alloc] init];
    
    
    profileVC.viewModel = [[ProfileViewModel alloc] initWithRequestService:requestHandler];
    profileVC.viewModel.user = user;
    return profileVC;
}
@end
