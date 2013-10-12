//
//  TWMTableViewController.m
//  Table
//
//  Created by Alexey Blinov on 23.07.13.
//  Copyright (c) 2013 Alexey Blinov. All rights reserved.
//

#import "TWMTableViewController.h"
#import "TWMRecord.h"


@implementation TWMTableViewController


- (id)init {
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
        editingMode = NO;
        controllerWindow = [[TWMWhatToFixWindowController alloc] initWithWindowNibName:@"WhatToFixWindow"];
        //toolsWindow = [[ToolsWindowController alloc] initWithWindowNibName: @"ToolsWindowController"];
    }
    return self;
}
/*
- (void)awakeFromNib {
    toolsWindow = [[ToolsWindowController alloc] initWithWindowNibName: @"ToolsWindowController"];
    [toolsWindow showWindow: self];
} */

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return [list count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    TWMRecord *rec = [list objectAtIndex: row];
    NSString *identifier = [tableColumn identifier];
    return [rec valueForKey: identifier];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    TWMRecord *rec = [list objectAtIndex: row];
    NSString *identifier = [tableColumn identifier];
    if (editingMode == YES)
        [rec setValue:object forKey:identifier];
}

- (IBAction)openInputWeightWindow:(id)sender {
    [insertWeightWindow display];
    [insertWeightWindow makeKeyAndOrderFront: nil];
}

- (IBAction)closeInputWeightWindow:(id)sender {
    insertWeight = [_insertWeightTextField floatValue];
    [_insertWeightTextField setFloatValue: 0];
    [_MainWindow makeKeyAndOrderFront: nil];
    [insertWeightWindow orderOut: nil];
    [list addObject: [[TWMRecord alloc] initWithWeight: insertWeight]];
    [tableView reloadData];
}

- (IBAction)remove:(id)sender {
    NSInteger removingRow = [tableView selectedRow];
    [tableView abortEditing];
    if (removingRow != -1)
        [list removeObjectAtIndex: removingRow];
    [tableView reloadData];
}

- (IBAction)editingMode:(id)sender {
        if ( editingMode == NO)
        {
            editingMode = YES;
            [_editingModeButton setState: 1];
        }
        else
        {
            editingMode = NO;
            [_editingModeButton setState: 0];
        }
}
- (IBAction)openWhatToFixWindow:(id)sender {
    [controllerWindow showWindow: self];
}
@end
