//
//  QuotesManager.m
//  YouLittleWeakling
//
//  Created by fredhedz on 7/9/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "QuotesManager.h"

@interface QuotesManager()

@property (nonatomic) NSMutableDictionary *indexes;

@end

@implementation QuotesManager

- (instancetype)init
{
    if (self = [super init]) {
        self.indexes = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:@"indexes_dictionary"] mutableCopy];
        if (!self.indexes) {
            self.indexes = [NSMutableDictionary new];
        }
    }
    return self;
}

- (NSMutableArray *)indexesForCategory:(NSString *)categoryName
{
    NSMutableArray *result = self.indexes[categoryName];
    if (!result) {
        result = [NSMutableArray new];
    }
    return result;
    
}

- (void)saveIndexes:(NSArray *)indexes forCategory:(NSString *)categoryName
{
    self.indexes[categoryName] = indexes;
    [[NSUserDefaults standardUserDefaults] setObject:self.indexes forKey:@"indexes_dictionary"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)quoteForDiet:(BOOL)diet exercise:(BOOL)exercise creativity:(BOOL)creativity life:(BOOL)life love:(BOOL)love study:(BOOL)study
{
    NSMutableArray *categoryArray = [NSMutableArray new];
    if (diet) {
        [categoryArray addObject:@"diet"];
    }
    if (exercise) {
        [categoryArray addObject:@"exercise"];
    }
    if (creativity) {
        [categoryArray addObject:@"creativity"];
    }
    if (life) {
        [categoryArray addObject:@"life"];
    }
    if (love) {
        [categoryArray addObject:@"love"];
    }
    if (study) {
        [categoryArray addObject:@"study"];
    }
    return [self quoteforCategory:categoryArray[arc4random_uniform(categoryArray.count)]];
}

- (NSString*)quoteforCategory:(NSString*)categoryName
{
    //initialize the array with lines from text file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_quotes", categoryName] ofType:@".txt"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    NSString *fileContents = [[NSString alloc] initWithBytes:[fileData bytes] length:[fileData length] encoding:NSUTF8StringEncoding];
    NSArray *quotesArray = [fileContents componentsSeparatedByString:@"\n"];
    NSMutableArray *usedIndexes = [[self indexesForCategory:categoryName] mutableCopy];
    
    //pick a random index that has not been used
    NSNumber *randomIndex = nil;
    while (randomIndex == nil) {
        randomIndex = [NSNumber numberWithInteger:arc4random_uniform(quotesArray.count)];
        if ([usedIndexes containsObject:randomIndex]) {
            randomIndex = nil;
        }
    }
    
    //add the new index to the front
    [usedIndexes insertObject:randomIndex atIndex:0];
    
    //trim the array if it is maxed
    if (usedIndexes.count >= 20) {
        [usedIndexes removeLastObject];
    }
    
    [self saveIndexes:usedIndexes forCategory:categoryName];

    return quotesArray[randomIndex.integerValue];
}

@end