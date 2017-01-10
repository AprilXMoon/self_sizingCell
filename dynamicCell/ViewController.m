//
//  ViewController.m
//  dynamicCell
//
//  Created by April Lee on 2017/1/6.
//  Copyright © 2017年 april. All rights reserved.
//

#import "ViewController.h"
#import "TableCell.h"

@interface ViewController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initialDataArray];
    [self initialTableCell];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initialDataArray
{
    _dataArray = @[ @{@"title" : @"one", @"detail" : @"For test~"},
                    @{@"title" : @"two", @"detail" : @"Today is good day. \n t1 \n t2 \n t3 \n t4"} ,
                    @{@"title" : @"three", @"detail" : @"Hi \nHi \nHi \nHi \nHi \nHi \nHi \nHi \nHi \nHi"},
                    @{@"title" : @"four", @"detail" : @"The End."} ];
}

- (void)initialTableCell
{
    self.contentTableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"TableCell" bundle:nil];
    [self.contentTableView registerNib:nib forCellReuseIdentifier:@"TableCell"];
    
    self.contentTableView.rowHeight = UITableViewAutomaticDimension;
    self.contentTableView.estimatedRowHeight = 90;
}


#pragma mark - table view DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dataInfo = _dataArray[indexPath.row];
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    
    cell.tag = indexPath.row;
    
    cell.titleLabel.text = dataInfo[@"title"];
    cell.Detail.text = dataInfo[@"detail"];
    
    return cell;
}

@end
