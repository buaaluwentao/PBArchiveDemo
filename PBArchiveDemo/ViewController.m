//
//  ViewController.m
//  PBArchiveDemo
//
//  Created by wentao lu on 2021/4/18.
//

#import "ViewController.h"
#import "PBPerson.h"

@interface ViewController ()
@property (nonatomic, strong) PBPerson *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *save = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    [save setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [save addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:save];
    
    UIButton *read = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    [read setTitle:@"保存" forState:UIControlStateNormal];
    [read setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [read addTarget:self action:@selector(read) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:read];
    
    _p = [[PBPerson alloc] init];
    _p.name = @"周巧灵";
    _p.age = 18;
}

- (NSString *)filePath {
    NSString *str =  NSTemporaryDirectory();
    NSLog(@"%@", str);
    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"person.txt"];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:_p
                                               toFile:[self filePath]];
}

- (void)read {
    PBPerson *p = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"%@今年%@岁了", p.name, @(p.age));
}


@end
