//
//  PersonInformationTableViewController.m
//  TextStoryBoard
//
//  Created by 戒惜舍得 on 12/15/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import "PersonInformationTableViewController.h"


typedef NS_OPTIONS(NSUInteger, PersonInformation) {
    PersonInformationNone                 = 0,
    PersonInformationLeft                 = 1 << 0,
    PersonInformationLocation             = 1 << 1,
    PersonInformationSex                  = 1 << 2
};



@interface PersonInformationTableViewController ()

@end

@implementation PersonInformationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Tableview Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0 && indexPath.section == 0 ) {
        NSLog(@" change Head Image");
    }
}

#pragma mark - touchEvents
- (IBAction)back:(UIButton *)sender {
    if (sender.tag & PersonInformationLeft) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (sender.tag & PersonInformationLocation){
        [self selectLocation];
    }else if (sender.tag & PersonInformationSex){
        [self selectSex];
    }
}


#pragma mark - privateMethod

- (void)selectLocation{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"善长位置" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"前锋" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"选择了前锋");
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"中锋" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"选择了中锋");
    }];
    
    [alertController  addAction:action0];
    [alertController  addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)selectSex{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"性别" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"选择了男性");
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"选择了女性");
    }];
    
    [alertController  addAction:action0];
    [alertController  addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];

}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:; forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
