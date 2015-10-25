//
//  ViewController.m
//  DDWaterFall
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 zhangdongdong. All rights reserved.
//

#import "ViewController.h"

#import "DDWaterFolwView.h"
#import "DDWaterFlowViewCell.h"

@interface ViewController ()<DDWaterFolwViewDataSource,DDWaterFolwViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
 
    [super viewDidLoad];
    
    DDWaterFolwView *waterFlowView = [[DDWaterFolwView alloc] init];
    waterFlowView.frame = self.view.bounds;
    waterFlowView.dataSource =self;
    waterFlowView.delegate =self;
    [self.view addSubview:waterFlowView];
//    [waterFlowView reloadData];
    
}

#pragma mark --数据源的方法

-(NSUInteger)numberOfCellsInWaterflowView:(DDWaterFolwView *)waterflowView{

    return 50;
}

//-(NSUInteger)numberOfColumnsInWaterflowView:(DDWaterFolwView *)waterflowView{
//
//    return 4;
//}

-(DDWaterFlowViewCell *)waterflowView:(DDWaterFolwView *)waterflowView cellAtIndex:(NSUInteger)index{
    static NSString*ID =@"cell";
    
    DDWaterFlowViewCell *cell = [waterflowView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DDWaterFlowViewCell alloc] init];
        cell.backgroundColor = DDRandomColor;
        cell.identifier = ID;
        UILabel *label = [[UILabel alloc] init];
        
        label.frame = CGRectMake(10, 10, 30, 30);
        label.tag = 100;
        [cell addSubview:label];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%ld",index];

    NSLog(@"%lu  %p",(unsigned long)index,cell);
    
    return cell;
}

- (CGFloat)waterflowView:(DDWaterFolwView *)waterflowView heightForCellAtIndex:(NSInteger)index{
 
    switch (index % 3) {
        case 0: return 100;
        case 1: return 110;
        case 2: return 150;
        default:
            break;
    }
    return 70;
}
/**
 *  单元格的点击事件
 */
- (void)waterflowView:(DDWaterFolwView *)waterflowView didSelectCellAtIndex:(NSInteger)index{

    NSLog(@"点击了%ld单元格",index);
}

/**
 *  返回间距
 */
- (CGFloat)waterflowView:(DDWaterFolwView *)waterflowView marginForType:(DDWaterFolwViewMarginType)type{
    switch (type) {
        case DDWaterFolwViewMarginTypeTop:
        case DDWaterFolwViewMarginTypeBottom:
        case DDWaterFolwViewMarginTypeLeft:
        case DDWaterFolwViewMarginTypeRight:
            return 10;
            break;
        default: return 13;
            break;
    }
}




@end
