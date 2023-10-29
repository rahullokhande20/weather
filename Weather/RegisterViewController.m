//
//  RegisterViewController.m
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *displayPicture;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *bio;



@end

@implementation RegisterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (IBAction)setupDisplayPicture:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.allowsEditing = YES; // set to NO if you don't want to allow editing
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else {
        NSLog(@"Camera not available.");
    }
    
}
- (IBAction)signupClicked:(id)sender {
    self.viewModel.user.displayName = self.username.text;
    self.viewModel.user.password = self.password.text;
    self.viewModel.user.email = self.email.text;
    self.viewModel.user.bio = self.bio.text;
    self.viewModel.user.image = self.displayPicture.image;
    [self.viewModel registerUser:^(BOOL success, NSError *error) {
        if (!success){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Registration" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault  handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"OK button tapped");
            }];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            [self redirectToProfile];
        }
        
    }];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.displayPicture.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void) redirectToProfile{
    ProfileViewController *profileVC = (ProfileViewController *)[ViewControllerProvider getProfileViewControllerFromUser:self.viewModel.user];
    [self.navigationController pushViewController:profileVC animated:YES];
    
}



@end
