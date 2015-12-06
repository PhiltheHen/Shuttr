//
//  FeedCollectionViewFlowLayout.m
//  Shuttr
//
//  Created by Philip Henson on 12/6/15.
//  Copyright © 2015 MMInstaGroup. All rights reserved.
//

#import "FeedCollectionViewFlowLayout.h"

@implementation FeedCollectionViewFlowLayout


-(id)init
{
    if (!(self = [super init])) return nil;

    self.itemSize = CGSizeMake(400, 400);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //self.minimumInteritemSpacing = 10.0f;
    //self.minimumLineSpacing = 10.0f;

    return self;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{

    // Ensures snapping to next cell regardless of scroll velocity
    if (proposedContentOffset.x > self.collectionView.contentOffset.x) {
        proposedContentOffset.x = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width / 2.;
    }
    else if (proposedContentOffset.x < self.collectionView.contentOffset.x) {
        proposedContentOffset.x = self.collectionView.contentOffset.x - self.collectionView.bounds.size.width / 2.;
    }

    
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + self.collectionView.bounds.size.width / 2.;
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0., self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);

    UICollectionViewLayoutAttributes *targetAttributes = nil;
    NSArray *attributes = [super layoutAttributesForElementsInRect:targetRect];
    for (UICollectionViewLayoutAttributes *a in attributes) {
        CGFloat itemHorizontalCenter = a.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
            targetAttributes = a;
        }
    }

    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

@end
