//xs
//  TWMTableViewController.h
//  Table
//
//  Created by Alexey Blinov on 23.07.13.
//  Copyright (c) 2013 Alexey Blinov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWMWhatToFixWindowController.h"



@interface TWMTableViewController : NSWindowController <NSTableViewDataSource> {
        IBOutlet NSTableView *tableView;
        NSMutableArray *list;
        BOOL editingMode;
        IBOutlet NSWindow *insertWeightWindow;
        __weak NSTextField *_insertWeightTextField;
        float insertWeight;
        TWMWhatToFixWindowController *controllerWindow;
        //ToolsWindowController *toolsWindow;
}

@property (unsafe_unretained) IBOutlet NSWindow *MainWindow;
@property (unsafe_unretained) IBOutlet NSPanel *toolPanel;
@property (weak) IBOutlet NSButton *editingMode;
@property (weak) IBOutlet NSButton *editingModeButton;
@property (weak) IBOutlet NSTextField *insertWeightTextField;


- (IBAction)openInputWeightWindow:(id)sender;
- (IBAction)closeInputWeightWindow:(id)sender;
- (IBAction)remove:(id)sender;
- (IBAction)editingMode:(id)sender;
- (IBAction)openWhatToFixWindow:(id)sender;



@end
