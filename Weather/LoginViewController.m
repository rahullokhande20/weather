//
//  ViewController.m
//  Weather
//
//  Created by Rahul Lokhande on 23/09/23.
//

#import "LoginViewController.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UserAuthService *userService = [[UserAuthService alloc] init];
    ImageStorageService *imageService = [[ImageStorageService alloc] init];
    UserDetailsStoreService *userDetailService = [[UserDetailsStoreService alloc] init];
    self.viewModel = [[LoginViewModel alloc]initWithAuthService:userService imageStorageService:imageService userDetailService:userDetailService];
    
    // Do any additional setup after loading the view.
}
- (IBAction)loginClicked:(id)sender {
    [self.viewModel loginWithEmail:self.email.text
                          password:self.password.text
                        completion:^(User *user, NSError *error) {
        if (! error){
            
            [self redirectToProfile:user];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault  handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"OK button tapped");
            }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
            NSLog(@"login failed");
        }
        
    }];
    
    
}
- (IBAction)signupClicked:(id)sender {
    
    RegisterViewController *registerVC = [ViewControllerProvider getRegisterViewController] ;
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
- (void) redirectToProfile:(User *)user{
    ProfileViewController *profileVC = [ViewControllerProvider getProfileViewControllerFromUser:user];
    [self.navigationController pushViewController:profileVC animated:YES];
    
}
@end
