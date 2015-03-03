//
//  ViewController.m
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "ViewController.h"
#import "ModelCell.h"
#import "FrameModel.h"
#import "DataModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *frameModels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)frameModels
{
    if (!_frameModels) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *frameModels = [NSMutableArray array];
        for (NSDictionary *dic in dicArr) {
            DataModel *dataModel = [DataModel dataModelWithDict:dic];
            FrameModel *frameModel = [[FrameModel alloc]init];
            frameModel.dataModel = dataModel;
            [frameModels addObject:frameModel];
        }
        _frameModels = frameModels;
    }
    return _frameModels;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.frameModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelCell *cell = [ModelCell modelCellWithTableView:tableView];
    cell.frameModel = self.frameModels[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FrameModel *frameModel = self.frameModels[indexPath.row];
    return frameModel.cellHeight;
}
@end
