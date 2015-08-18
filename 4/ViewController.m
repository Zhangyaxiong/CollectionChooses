//
//  ViewController.m
//  4
//
//  Created by 张亚雄 on 15/8/17.
//  Copyright (c) 2015年 ZhangYaxiong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
//static NSString *cellIdentifier = @"cell";
////static NSString *kcellIdentifier = @"collectionCellID";
@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 568) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
//    for (index = 0; index < 5; ++index)
//    {
//        // Setup image name
//        NSString *name = [NSString stringWithFormat:@"image%03ld.jpg", (unsigned long)index];
//        if(!self.images)
//            self.images = [NSMutableArray arrayWithCapacity:0];
//        [self.images addObject:name];
//    }

}


#pragma mark -- UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString * CellIdentifier = @"UICollectionViewCell";
 
   UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height-20)];
    NSString *imageToLoad  = [NSString stringWithFormat:@"%ld.jpg", (long)indexPath.row];
    imageview.image = [UIImage imageNamed:imageToLoad];
    [cell addSubview:imageview];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-40, cell.frame.size.width, 20)];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor whiteColor];
    label.text = imageToLoad;
    [cell addSubview:label];
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(177,180);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
//  上坐下右
}

@end

