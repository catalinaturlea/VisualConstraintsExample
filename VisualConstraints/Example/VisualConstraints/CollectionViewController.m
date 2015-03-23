//
//  CollectionViewController.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 3/23/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "CollectionViewController.h"
#import "ResizableCollectionViewCell.h"

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation CollectionViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	ResizableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ResizableCell" forIndexPath:indexPath];
	[cell.textLabel setText:[NSString stringWithFormat:@"%@\n--\n--\n--", indexPath]];
	return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    ResizableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ResizableCell" forIndexPath:indexPath];

	[cell.textLabel setText:[NSString stringWithFormat:@"%@\n--\n--\n--", indexPath]];
    [cell.contentView layoutIfNeeded];
	return  [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

@end
