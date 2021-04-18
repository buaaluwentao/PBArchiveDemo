//
//  ViewController.m
//  PBArchiveDemo
//
//  Created by wentao lu on 2021/4/18.
//

#import "ViewController.h"
#import "PBPerson.h"
#import "PBFamily.h"

@interface ViewController ()
@property (nonatomic, strong) PBFamily *f;
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
    
    _f = [[PBFamily alloc] init];
    _f.lwt = [[PBPerson alloc] init];
    _f.lwt.age = 29;
    _f.lwt.name = @"lwt";
    
    _f.zql = [[PBPerson alloc] init];
    _f.zql.name = @"周巧灵";
    _f.zql.age = 18;
}

- (NSString *)filePath {
    NSString *str =  NSTemporaryDirectory();
    NSLog(@"%@", str);
    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"person.txt"];
}

- (void)save {
//    [NSKeyedArchiver archiveRootObject:_p toFile:[self filePath]];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_f requiringSecureCoding:YES error:nil];
    [data writeToFile:[self filePath] atomically:YES];
}

- (void)read {
//    PBPerson *p = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    
    NSData *data = [NSData dataWithContentsOfFile:[self filePath]];
    NSError *error;
    //非原生对象要放在set中
    NSSet *set = [NSSet setWithArray:@[PBFamily.class, PBPerson.class]];
    PBFamily *f = [NSKeyedUnarchiver unarchivedObjectOfClasses:set fromData:data error:&error];
    NSLog(@"%@今年%@岁了", f.lwt.name, @(f.lwt.age));
    
}


@end
