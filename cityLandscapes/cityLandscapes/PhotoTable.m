//
//  PhotoTable.m
//  cityLandscapes
//
//  Created by Dan Mindru on 11/03/14.
//  Copyright (c) 2014 Dan Mindru. All rights reserved.
//

#import "PhotoTable.h"
#import "AddPostcard.h"

@interface PhotoTable (){
	NSMutableArray *loadedPostcardObjects;
}

@end

@implementation PhotoTable

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
	
	//set the title of the view
	self.title = @"My postcards";
}

-(void)viewWillAppear:(BOOL)animated{
	
	//initialize the loaded photos array
	loadedPostcardObjects = [[NSMutableArray alloc]init];
	
	//init URL
	NSString *postcardURL = [appPhoto getUrl];
	
	loadedPostcardObjects = [appPhoto readFromPlist:postcardURL];
}

- (void)viewDidAppear:(BOOL)animated{
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return loadedPostcardObjects.count;
}

/*
//set the title of table sections
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return @"City photos";
}
*/

#pragma mark - Table cells

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"imageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell
	appPhoto *current = [loadedPostcardObjects objectAtIndex:indexPath.row];
	cell.textLabel.text = [current title];
	cell.detailTextLabel.text = [current description];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

#pragma cell editing

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		//update number of rows
		[self removeEntryFromDictionary:indexPath];
		
		//remove from PLIST
			//init URL
			NSString *postcardURL = [appPhoto getUrl];
			//remove
		[appPhoto removeFromPlist:postcardURL andObjects:loadedPostcardObjects];
		
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		//not implemented for now
    }   
}

//remove the postcard stored in the dictionary
- (void)removeEntryFromDictionary:(NSIndexPath *)indexPath{
	//just remove one of the object that is already loaded
	[loadedPostcardObjects removeObjectAtIndex:indexPath.row];
}

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

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	//set the destination view controller
	if([[segue identifier] isEqualToString:@"displayPhoto"]){
		SinglePhotoView *spv = [segue destinationViewController];
		
		//get the selected image and pass the instance of photo
		NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
		appPhoto *selectedPhoto = loadedPostcardObjects[selectedPath.row];
		
		spv.currentPhoto = selectedPhoto;
	}
	else{
		//other segues
	}
}


@end
