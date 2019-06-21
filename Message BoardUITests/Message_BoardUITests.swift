//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // KEEP THIS SETUP FUNCTION EXACTLY AS IS.
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
	
	
	func test_KeyboardWithTest7() {
		
		for key in appKeysWithTest7 {
			XCTAssertTrue(key.exists)
			key.tap()
		}
	}
	
	func test_createNewthread() {
		XCTAssertTrue(createThreadTextField.exists)
		createThreadTextField.tap()
		
		test_KeyboardWithTest7()
		
		XCTAssertTrue(returnKey.exists)
		returnKey.tap()
		
		XCTAssertTrue(cellTest7.exists)
	}
	
	func test_navigatoToTest7() {
		test_createNewthread()
		cellTest7.tap()
		XCTAssertTrue(navTest7.exists)
	}
	
	func test_navigatoCreateMessage() {
		test_navigatoToTest7()
		XCTAssertTrue(addMessageButton.exists)
		addMessageButton.tap()
		XCTAssertTrue(navNewMessage.exists)
		XCTAssertTrue(createMessageTextField.exists)
	}
	
	func test_createMessage() {
		test_navigatoCreateMessage()
		
		createMessageTextField.tap()
		
		test_KeyboardWithTest7()
		
		
		
	}
	
	
	
	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	var createThreadTextField: XCUIElement {
		return app.tables.textFields["Create a new thread:"]
	}
	
	var appKeysWithTest7: [XCUIElement] {
		return [app.keys["t"], app.keys["e"], app.keys["s"], app.keys["t"], app.keys["space"] ,app.keys["more"], app.keys["7"]]
	}
	
	var cellTest7: XCUIElement {
		return app.tables.staticTexts["test 7"]
	}
	
	var returnKey: XCUIElement {
		return app.buttons["Return"]
	}
	
	var navTest7: XCUIElement {
		return app.navigationBars["test 7"]
	}
	var addMessageButton: XCUIElement {
		return navTest7.buttons["Add"]
	}
	
	var navNewMessage: XCUIElement {
		return app.navigationBars["New Message"]
	}
	
	var createMessageTextField: XCUIElement {
		return app.textFields["Enter your name:"]
	}
	
}
