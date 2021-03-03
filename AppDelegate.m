//
//  AppDelegate.m
//  MenuTest
//
//  Created by Randall Hedglin on 09/25/15.
//  Copyright © 2015 WaveBreak Software. All rights reserved.
//

#import "AppDelegate.h"
@import AppKit;

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@end

#define DEBUG_MSG(msg) { NSAlert* alert = [[NSAlert alloc] init]; alert.alertStyle = NSInformationalAlertStyle; alert.informativeText = msg; [alert runModal]; }

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// get main application
	NSApplication* application = [NSApplication sharedApplication];
	
	// get main menu
	NSMenu* mainMenu = [application mainMenu];
	
	// check main menu
	if(mainMenu)
	{
		// prepare full-screen menu item
		NSMenuItem* fsMenuItem = [[NSMenuItem alloc] initWithTitle: @"Toggle Full Screen"
															action: NULL
													 keyEquivalent: @"f" ];
		
		// set key modifier mask
		NSInteger modifierMask = NSControlKeyMask |
		NSCommandKeyMask ;
		
		// set key modifier
		[fsMenuItem setKeyEquivalentModifierMask: modifierMask];
		
		// search for edit menu
		NSMenuItem* editMenu = [mainMenu itemWithTitle: @"Edit"];
		
		// remove edit menu
		if(editMenu)
			[mainMenu removeItem: editMenu];
		
		// search for view menu item
		NSMenuItem* viewMenuItem = [mainMenu itemWithTitle: @"View2"];
		
		// check view menu
		if(viewMenuItem)
		{
			// get submenu
			NSMenu* subMenu = [viewMenuItem submenu];
			
			// add new items to submenu
			if(subMenu)
			{
				// add separator
				[subMenu addItem: [NSMenuItem separatorItem]];
				
				// add full-screen item
				[subMenu addItem: fsMenuItem];
			}
		}
		else
		{
			// create view menu item
			viewMenuItem = [[NSMenuItem alloc] initWithTitle: @"View2"
													  action: NULL
											   keyEquivalent: @"" ];
			
			// create view submenu
			NSMenu* viewSubMenu = [[NSMenu alloc] initWithTitle: @"View2"];

			// set as submenu of view menu item
			[viewMenuItem setSubmenu: viewSubMenu];

			// add full-screen item
			[viewSubMenu addItem: fsMenuItem];
			
			// get index of window menu
			NSInteger windowIdx = [mainMenu indexOfItemWithTitle: @"Window"];
			
			// check index
			if(windowIdx > 0)
			{
				// bump it up
				[mainMenu insertItem: viewMenuItem
							 atIndex: windowIdx ];
			}
			else
			{
				// add to end of main menu
				[mainMenu addItem: viewMenuItem];
			}
		}
	}
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	// Insert code here to tear down your application
}

@end
