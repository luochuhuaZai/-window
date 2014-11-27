//
//  MovieViewController.m
//  云窗
//
//  Created by huazai on 14-8-27.
//  Copyright (c) 2014年 litterDeveloper. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieCollectionViewCell.h"

@interface MovieViewController ()
{
    NSString *xmlPath;
}
@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *collectionCellID = @"cell2";
    
    MovieCollectionViewCell *cell = (MovieCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    self.movie = self.parser.tests[indexPath.row];
    
    cell.imagePoster.image = self.movie.poster;
    cell.movieName.text = self.movie.movieName;
    cell.movieText.text = self.movie.country;
    
    cell.imagePoster.layer.borderWidth = 3.0f;
    cell.imagePoster.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
