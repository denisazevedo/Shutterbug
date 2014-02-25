//
//  JustPostedFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Denis C de Azevedo on 25/02/14.
//  Copyright (c) 2014 Denis C de Azevedo. All rights reserved.
//

#import "JustPostedFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface JustPostedFlickrPhotosTVC ()

@end

@implementation JustPostedFlickrPhotosTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos {
    
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    NSData *jsonResults = [NSData dataWithContentsOfURL:url];
//    NSError *error = nil;
    NSDictionary *propertyListResults = [NSJSONSerialization JSONObjectWithData:jsonResults
                                                                        options:0
                                                                          error:NULL]; //error:&error];
    //NSLog(@"Flickr result = %@", propertyListResults);
    NSArray *photos = [propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.photos = photos;
}

@end
