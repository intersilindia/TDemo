//
//  vitalViewController.h
//  TDemo
//
//  Created by apple on 4/9/14.
//  Copyright (c) 2014 Intersil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vitalViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(strong,nonatomic)NSMutableArray *sections;

@property(strong,nonatomic)NSMutableArray *array1;
@property(strong,nonatomic)NSMutableArray *array2;

@property(strong,nonatomic)IBOutlet UILabel *vtitle;

@end
