//
//  CollectionViewCell.h
//  testCollectionCell
//
//  Created by 戒惜舍得 on 15/9/2.
//  Copyright (c) 2015年 戒惜舍得. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellObject.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) cellObject *model;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureHeightConstraints;


@end
