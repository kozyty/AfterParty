//
//  CVCLCoverFlowLayout.m
//  AfterParty
//
//  Created by kozyty on 2014/02/23.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "CVCLCoverFlowLayout.h"

@implementation CVCLCoverFlowLayout

- (NSInteger)count {
    return [self.collectionView numberOfItemsInSection:0];
}

- (CGSize)collectionViewContentSize {
    CGSize size = self.collectionView.bounds.size;
    size.width = self.count * self.cellInterval;
    return size;
}

- (NSArray *)indexPathsForItemsInRect:(CGRect)rect {
    CGFloat cw = self.cellInterval;
    int minRow = MAX(0, (int)floor(rect.origin.x /cw));
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=minRow; i < self.count && (i-1) * cw / rect.origin.x + rect.size.width ; i++) {
        [array addObject:[NSIndexPath indexPathForItem:i inSection:0]];
    }
    return array;
}
@end
