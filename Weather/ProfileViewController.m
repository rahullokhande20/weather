//
//  ProfileViewController.m
//  Weather
//
//  Created by Rahul Lokhande on 25/09/23.
//

#import "ProfileViewController.h"
@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *bio;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"user %@ %@ %@ ",self.viewModel.user.displayName,self.viewModel.user.bio, self.viewModel.user.image);
    self.profilePicture.image = self.viewModel.user.image;
    self.displayName.text = self.viewModel.user.displayName;
    self.bio.text = self.viewModel.user.bio;
    self.navigationItem.title = @"User Profile";
}
- (IBAction)cityEntered:(id)sender {
    [ self.viewModel getWeatherFromCity:self.cityName.text completion:^(BOOL success, NSError * _Nonnull error) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData ];
            });
            
        }
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.climate.list.count > 7 ? 7 :self.viewModel.climate.list.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClimateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClimateCell" forIndexPath:indexPath];
    WList *list = (WList *)[self.viewModel.climate.list objectAtIndex:indexPath.row];
   
    
    
    cell.date.text = list.formattedDate;
    cell.temperature.text = [NSString stringWithFormat:@" %@ ",  ((Weather *)[list.weather firstObject]).desc];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WList *list = [self.viewModel.climate.list objectAtIndex:indexPath.row];
    DetailsViewController *detailsVC = [ViewControllerProvider getDetailsViewControllerFromItem:list city:self.cityName.text];
    [self.navigationController pushViewController:detailsVC animated:YES];
    
}
@end
