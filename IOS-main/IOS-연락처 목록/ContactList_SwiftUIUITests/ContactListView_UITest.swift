//
//  ContactListView_UITest.swift
//  ContactList_SwiftUIUITests
//
//  Created by Luciano Puzer on 12/02/22.
//

import XCTest

//Naming Structure: test_UnitOfwork_StateUnderTest_ExpectedBehavior
//Naming Structure: test_[struct]_[ui component]_[expectedBehavior]
//Testing Structure: Given, When, Then

class ContactListView_UITest: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
    }

    
    func test_ContactListViw_gearButton_shouldTypeAndAppearSheet(){
        
        //Given
        let app = XCUIApplication()
        app.children(matching: .window).element.tap()
        
        //Whenn
        let tablesQuery = app.tables
        let element = tablesQuery.cells["Luciano, gearshape, 94949494944"].children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element.tap()
        
        //Then
        XCTAssertTrue(app.exists)
    }
    
    func test_ContactListViw_gearButtonOptions_shouldTypeCancelOption(){
        
        //Given
        clickOnGearButton()
        
        //Whenn
        app.sheets["Select an option"].scrollViews.otherElements.buttons["Cancel"].tap()
        
        //Then
        XCTAssertTrue(app.exists)
    }
    
    
    func test_ContactListViw_gearButtonOptions_shouldTypeEditOption(){
        
        //Given
        clickOnGearButton()
        
        //Whenn
        app.sheets["Select an option"].scrollViews.otherElements.buttons["Edit"].tap()
        
        //Then
        XCTAssertTrue(app.exists)
 
    }

    
}
    
//MARK: FUNCTIONS

extension ContactListView_UITest {
        func clickOnGearButton() {
            let app = XCUIApplication()
            app.children(matching: .window).element.tap()

            let tablesQuery = app.tables
            let element = tablesQuery.cells["Luciano, gearshape, 94949494944"].children(matching: .other).element(boundBy: 0).children(matching: .other).element
            element.tap()
        }
    }

