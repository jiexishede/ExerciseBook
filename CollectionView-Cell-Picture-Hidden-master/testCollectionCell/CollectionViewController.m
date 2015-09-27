//
//  CollectionViewController.m
//  testCollectionCell
//
//  Created by 戒惜舍得 on 15/9/2.
//  Copyright (c) 2015年 戒惜舍得. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "cellObject.h"

@interface CollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *hahaArray;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";
//static NSString * const reuseIdentifiersecond = @"cellsecond";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
//    CGFloat width  = self.view.frame.size.width;
//    CGFloat esHeight = 200;
//    self.flowLayout.estimatedItemSize = CGSizeMake(width, esHeight);
    NSMutableArray *hahmautaArray = [NSMutableArray array];
    
    for (int i = 0; i  < 31; i++) {
        cellObject *object = [[cellObject alloc] init];
        if (i %2) {
            
            object.firstLabelText  = @"----";
            object.secondLabelText = @"NONONONO+sfasfsecond";
            object.haveImage  = YES;
        } else {
      
        object.firstLabelText  = @"aadfadfda";
        object.secondLabelText = @"YESsfsfasfsecond";
        object.haveImage  = NO;
        }
        [hahmautaArray addObject:object];
    }
    self.hahaArray = hahmautaArray;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 17;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.hahaArray [indexPath.item];
    return cell;
}

#pragma mark <UICollectionViewDelegate>


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    cellObject *model = self.hahaArray[indexPath.item];
    CGFloat height;
    //  self.pictureConstraint.constant = 149;  41 is secondLabel .frame.origin.y ; 21 is secondLable.frame.size.height
    if (model.haveImage) {
        height = 41 + 21 + 149 + 20 ;
    } else{
        height = 41 + 21 + 20 ;
    }
    return  CGSizeMake(self.flowLayout.itemSize.width, height);
}


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
