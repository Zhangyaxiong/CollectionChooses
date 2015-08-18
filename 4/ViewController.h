//
//  ViewController.h
//  4
//
//  Created by 张亚雄 on 15/8/17.
//  Copyright (c) 2015年 ZhangYaxiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
 
}
@property(strong,nonatomic)UICollectionView *collectionView;
@property(nonatomic,readonly) NSArray       *images;

@end

