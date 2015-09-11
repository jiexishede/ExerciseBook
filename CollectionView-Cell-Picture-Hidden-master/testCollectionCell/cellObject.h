//
//  cellObject.h
//  testCollectionCell
//
//  Created by 戒惜舍得 on 15/9/2.
//  Copyright (c) 2015年 戒惜舍得. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cellObject : NSObject

@property (nonatomic, copy) NSString *firstLabelText;

@property (nonatomic, copy) NSString *secondLabelText;

@property (nonatomic, assign, getter=ishaveImageed) BOOL haveImage;

@end
