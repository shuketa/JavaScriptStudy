

#import "MainViewController.h"
#import "SubViewController.h"

@interface MainViewController ()

@end


// TODO: やらないといけない項目
// FIXME: 修正が必要な項目
// MARK: 注意点などのマーキング
// !!!: 重要なポイント
// ???: 疑問のあるポイント


@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"MainViewController";
    
}


- (IBAction)pressPushButton:(id)sender
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self postNotification:nil];
    });
    
    [self.navigationController pushViewController:[[SubViewController alloc] init] animated:YES];
    
}

- (IBAction)postNotification:(id)sender {
    NSLog(@"postNotification");
    NSDictionary *dict = @{@"key":@"value"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationName" object:self userInfo:dict];
}


@end
