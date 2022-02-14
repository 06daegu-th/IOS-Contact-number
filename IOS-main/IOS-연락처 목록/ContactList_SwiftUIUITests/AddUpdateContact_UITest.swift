//
//  AddUpdateContact_UITest.swift
//  ContactList_SwiftUIUITests
//
//  Created by Luciano Puzer on 12/02/22.
//


import XCTest
//Naming Structure: test_UnitOfwork_StateUnderTest_ExpectedBehavior
//Naming Structure: test_[struct]_[ui component]_[expectedBehavior]
//Testing Structure: Given, When, Then

class AddUpdateContact_UITest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    
    
    func test_AddUpdateContact_nameTextFiel_shouldTypeKeyBoard(){
        //Given
        clickOnAddButton()
        
        //When
        app.textFields["Name"].tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let aKey2 = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey2.tap()
        aKey2.tap()
        
        //Then
        XCTAssertTrue(app.exists)
        
    }
    
    
    func test_AddUpdateContact_phoneTextFiel_shouldTypeKeyBoard() {
        //Given
        clickOnAddButton()
        
        //When
        app.textFields["Phone"].tap()
        
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()
        key.tap()
        
        //Then
        XCTAssertTrue(app.exists)
        
    }
    
    func test_AddUpdateContact_addContactButton_shouldAddContact() {
        
        
    }
    
}


//MARK: FUNCTIONS

extension AddUpdateContact_UITest {
    func clickOnAddButton() {
        
        let navBar = XCUIApplication().navigationBars["Contact List"]
        navBar.staticTexts["Contact List"].tap()
        navBar.buttons["Add Contact"].tap()

                
    }
    
}

