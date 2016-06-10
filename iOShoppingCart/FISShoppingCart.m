//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"


@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents
{
    NSInteger totalPrice = 0;
    
    for (FISItem *item in self.items)
    {
        totalPrice = (totalPrice + item.priceInCents);
    }
    return totalPrice;
}

-(void)addItem:(FISItem *)item
{
    [self.items addObject:item];
}
-(void)removeItem:(FISItem *)item
{
    NSUInteger i = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:i];
}
-(void)removeAllItemsLikeItem:(FISItem *)item
{
    [self.items removeObjectIdenticalTo:item];
}
-(void)sortItemsByNameAsc
{
    NSSortDescriptor *sortAsc = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    [self.items sortUsingDescriptors: @[sortAsc]];
}
-(void)sortItemsByNameDesc
{
    NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors: @[sortDesc]];
}
-(void)sortItemsByPriceInCentsAsc
{
    NSSortDescriptor *sortAsc = [[NSSortDescriptor alloc]initWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors: @[sortAsc]];
}
-(void)sortItemsByPriceInCentsDesc
{
    NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc]initWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors: @[sortDesc]];
}
-(NSArray *)allItemsWithName:(NSString *)name
{
    NSMutableArray *itemsWithName = [[NSMutableArray alloc]init];
    for (FISItem *item  in self.items)
    {
        if ([item.name isEqualToString:name])
        {
            [itemsWithName addObject:item];
        }
        
    }
    return itemsWithName;
}
-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)minPrice
{
    NSPredicate *itemWithMin = [NSPredicate predicateWithFormat: @"priceInCents >= %lu", minPrice];
    NSArray *item = [self.items filteredArrayUsingPredicate: itemWithMin];
    return item;
}
-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)maxPrice
{
    NSPredicate *itemWithMax = [NSPredicate predicateWithFormat: @"priceInCents <= %lu", maxPrice];
    NSArray *item = [self.items filteredArrayUsingPredicate: itemWithMax];
    return item;
}
@end
