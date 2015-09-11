//
//  CollectionViewCell.m
//  testCollectionCell
//
//  Created by 戒惜舍得 on 15/9/2.
//  Copyright (c) 2015年 戒惜舍得. All rights reserved.
//

#import "CollectionViewCell.h"
@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *firstLabelView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView33;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureConstraint;
@property (weak, nonatomic) IBOutlet UILabel *secondLabelView;

@end

@implementation CollectionViewCell

- (void)setModel:(cellObject *)model{
    _model = model;
    self.firstLabelView.text = model.firstLabelText;
    self.secondLabelView.text = model.secondLabelText;
    if (model.haveImage) {
        self.pictureView.image = [UIImage imageNamed:@"kitten"];
        self.pictureConstraint.constant = 149;
    } else {
        self.pictureConstraint.constant = 0;
    }
}

@end
