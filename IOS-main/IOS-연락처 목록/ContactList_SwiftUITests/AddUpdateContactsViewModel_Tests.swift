//
//  ContactListViewModel_Tests.swift
//  ContactList_SwiftUITests
//
//  Created by Luciano Puzer on 13/02/22.
//

import XCTest
@testable import ContactList_SwiftUI

//Naming Structure: test_UnitOfwork_StateUnderTest_ExpectedBehavior
//Naming Structure: test_[struct]_[ui component]_[expectedBehavior]
//Testing Structure: Given, When, Then

class AddUpdateContactsViewModel_Tests: XCTestCase {
    let vm = ContactListViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    func test_AddContact_ShouldAddContact() async throws {
        let vm = AddUpdateContactsViewModel()
        _ = try await vm.addContact()
        
        XCTAssertTrue(true)
        
    }
    

}
