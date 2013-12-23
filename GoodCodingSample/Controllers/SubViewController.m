
#import "SubViewController.h"


@interface SubViewController ()
@property id notificationObserver;
@property (nonatomic,strong) NSMutableArray *testArray;
@end


@implementation SubViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testArray = [NSMutableArray array];
    [self.testArray addObject:@"tarou1"];
    [self.testArray addObject:@"tarou2"];
    [self.testArray addObject:@"tarou3"];
    
    // !!!: block内ではweakなselfを参照する
    __weak SubViewController* wself=self;
    
    self.notificationObserver = [[NSNotificationCenter defaultCenter] addObserverForName:@"notificationName"
                          object:nil
                           queue:[NSOperationQueue mainQueue]
                      usingBlock:^(NSNotification *note) {
                          //NSLog(@"isMain=%d",[NSThread isMainThread]);
                          NSLog(@"receiveNotification");
                          NSLog(@"name=%@",[wself.testArray objectAtIndex:2]);
                      }];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.testArray removeAllObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // TODO: 必要なくなったリソースのクリーンアップコードを書く
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self.notificationObserver];
    NSLog(@"dealloc");
}


@end
