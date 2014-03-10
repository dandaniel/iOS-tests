//
//  ViewController.m
//  simpleTables
//
//  Created by Dan Mindru on 10/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *dummyTable;
@property (strong, nonatomic) NSDictionary *dummyData;
@property (strong, nonatomic) NSDictionary *dummySettings;
@property (strong, nonatomic) NSArray *dataKeys;
@property (strong, nonatomic) NSArray *dataValues;
@property (strong, nonatomic) NSArray *settingsKeys;
@property (strong, nonatomic) NSArray *settingsValues;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	//get url's
	NSURL *dummyDataURL = [[NSBundle mainBundle] URLForResource:@"dummyData" withExtension:@"plist"];
	NSURL *dummySettingsURL = [[NSBundle mainBundle] URLForResource:@"dummySettings" withExtension:@"plist"];
	
	//get data from plist
	self.dummyData = [[NSDictionary alloc] initWithContentsOfURL:dummyDataURL];
	self.dummySettings = [[NSDictionary alloc] initWithContentsOfURL:dummySettingsURL];
	
	//store the keys
	self.dataKeys = self.dummyData.allKeys;
	self.settingsKeys = self.dummySettings.allKeys;
	
	//store the values
	NSMutableArray *temporaryDataValues = [[NSMutableArray alloc] init];
	for (NSDictionary *elementValue in self.dummyData.allValues) {
		//overcomplicated here, maybe with no purpose - looping in a nested ditcionary from the P-LIST
		for (NSString *stringValue in elementValue.allValues){
			[temporaryDataValues addObject:stringValue];
		}
	}

	self.dataValues = temporaryDataValues;
	self.settingsValues = self.dummySettings.allValues;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	if(section == 0){
		return @"Facts for geeks";
	}
	else{
		return @"App settings";
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UITableViewCell *cell;
	
	if(indexPath.section == 0){
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"defaultCell"];
		cell.textLabel.text = self.dataKeys[indexPath.row];
		cell.detailTextLabel.text = self.dataValues[indexPath.row];
	}
	else{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingsCell"];
		
		cell.textLabel.text = self.settingsKeys[indexPath.row];
		cell.detailTextLabel.text = self.settingsValues[indexPath.row];
	}
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	if(section == 0){
		return self.dataKeys.count;
	}
	else{
		return self.settingsKeys.count;
	}
		
}

@end
