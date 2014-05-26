//
//  vitalViewController.m
//  TDemo
//
//  Created by apple on 4/9/14.
//  Copyright (c) 2014 Intersil. All rights reserved.
//

#import "vitalViewController.h"

@interface vitalViewController ()

@end

@implementation vitalViewController
int i;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.sections = [[NSMutableArray alloc]initWithObjects:@"Pulse",@"Blood Pressure",@"Temp",@"Respirations", nil];
    self.array1 = [[NSMutableArray alloc]initWithObjects:@"Above",@"Below", nil];

    self.array2 = [[NSMutableArray alloc]initWithObjects:@"tes 1", nil];
    NSLog(@"THis is my new  2nd commit");
   

     NSLog(@"THis is my new  3rd commit");
    
     NSLog(@"Updated on 23rd may");
    
    NSLog(@"Updated on 26th may");

    UIView *view;
    
        
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
        /* Create custom view to display section header... */
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.tableView.frame.size.width, 40)];
        label.backgroundColor = [UIColor clearColor];
        
        [label setFont:[UIFont boldSystemFontOfSize:15]];
        NSString *string =@"   Vitals           BenchMark        Values";
        /* Section header is in 0th index... */
        [label setText:string];
    self.tableView.tableHeaderView = view;
        [view addSubview:label];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [self.array1 objectAtIndex:section];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
        return 4;
 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0 || section == 3) {
             return self.array1.count;

    }
    else
    {
        return self.array2.count;

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	UILabel *lblName = (UILabel *)[cell viewWithTag:20];
    if (indexPath.row == 0) {
         [lblName setText:[self.sections objectAtIndex:[indexPath section]]];
    }
    else
    {
        [lblName setText:@""];
    }
    lblName.numberOfLines = 0;
            // Configure the cell...
       // UILabel *a = (UILabel *)[self.view viewWithTag:20];
//        cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
   
UITextField *txt = (UITextField *)[cell viewWithTag:100];
    txt.tag = i;
    i++;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    /*UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    label.backgroundColor = [UIColor clearColor];
    
    [label setFont:[UIFont boldSystemFontOfSize:24]];
    NSString *string =@"Alert Name";
    /* Section header is in 0th index... */
    /*[label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
     NSUInteger newLength = textField.text.length + string.length - range.length;
    
    if(textField.tag == 3)
    {
       
        
        BOOL withinMaxLengthLimit = (newLength <= 4);
        
        if (!withinMaxLengthLimit)
        {
            // suppress the max length message only when the user is typing
            // easy: pasted data has a length greater than 1; who copy/pastes one character?
            if (string.length > 1)
            {
                // BasicAlert(@"", @"This field accepts a maximum of 4 characters.");
            }
            
            return NO;
        }
        
        
        if (newLength == 4 && ![string isEqualToString:@""]) {
            NSMutableString *mu = [NSMutableString stringWithString:textField.text];
            [mu insertString:@"." atIndex:3];
            textField.text =mu;
           
        }


    }
    else
    {
      
        
        BOOL withinMaxLengthLimit = (newLength <= 3);
        
        if (!withinMaxLengthLimit)
        {
            // suppress the max length message only when the user is typing
            // easy: pasted data has a length greater than 1; who copy/pastes one character?
            if (string.length > 1)
            {
                // BasicAlert(@"", @"This field accepts a maximum of 4 characters.");
            }
            
            return NO;
        }

    }
    // allow backspace
    if (!string.length)
    {
        return YES;
    }
    
    // remove invalid characters from input, if keyboard is numberpad
   
        if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
        {
            // BasicAlert(@"", @"This field accepts only numeric entries.");
            
            return NO;
        }
   
    
    // verify max length has not been exceeded
    
    
    return YES;
}


@end
