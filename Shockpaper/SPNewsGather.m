//
//  SPNewsGather.m
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/9.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import "SPNewsGather.h"
#import "SPSecondViewController.h"
#import "XPathQuery.h"

@implementation SPNewsGather

@synthesize titles = _titles;
@synthesize links = _links;
@synthesize descriptions = _descriptions;
@synthesize images = _images;

#pragma mark - Instance Methods


- (void)rssGetter:(UIViewController *)controller{
    
    viewController = (SPSecondViewController *)controller;
    responseData = [NSMutableData data];
    
    NSString *url = [NSString stringWithFormat:@"http://www.shockpaper.com/feed/"];
    theURL = [NSURL URLWithString:url];

    NSURLRequest *request = [NSURLRequest requestWithURL:theURL];
    (void)[[NSURLConnection alloc] initWithRequest:request delegate:self];

}

#pragma mark - NSURLConnection Delegate Methods

- (NSURLRequest *)connection: (NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response{
    @autoreleasepool {
        theURL = [request URL];
    }
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error: %@", error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *xpathQueryString;
    NSArray *nodes;
    //NSArray *imageNodes;
    
    //Titles
    xpathQueryString = @"//title";
    nodes = PerformXMLXPathQuery(responseData, xpathQueryString);
    NSMutableArray *tmp_titles = [[NSMutableArray alloc] init];
    for (NSDictionary *node in nodes){
        for (id key in node){
            if ([key isEqualToString:@"nodeContent"] && ![[node objectForKey:key] isEqualToString:@"Shock 三峽客"]){
                [tmp_titles addObject:[node objectForKey:key]];
            }
        }
    }
    self.titles = tmp_titles;
    //NSLog(@"Title: %@", self.titles);
    
    //Links
    xpathQueryString = @"//link";
    nodes = PerformXMLXPathQuery(responseData, xpathQueryString);
    NSMutableArray *tmp_links = [[NSMutableArray alloc] init];
    for (NSDictionary *node in nodes){
        for (id key in node){
            if ([key isEqualToString:@"nodeContent"] && ![[node objectForKey:key] isEqualToString:@"http://www.shockpaper.com"]){
                [tmp_links addObject:[node objectForKey:key]];
                NSLog(@"Link: %@", [node objectForKey:key]);
            }
        }
    }
   // NSLog(@"Links: %@", tmp_links);
    self.links = tmp_links;
    
    //Description
    xpathQueryString = @"//description";
    nodes = PerformXMLXPathQuery(responseData, xpathQueryString);
    NSMutableArray *tmp_descriptions = [[NSMutableArray alloc] init];
    for (NSDictionary *node in nodes){
        for (id key in node){
            if ([key isEqualToString:@"nodeContent"] && ![[node objectForKey:key] isEqualToString:@"專屬於三峽的社區地方媒體"]){
                [tmp_descriptions addObject:[node objectForKey:key]];
            }
        }
    }
    self.descriptions = tmp_descriptions;
    [viewController.tableView reloadData];
}

@end
