//
//  ContactListViewModel_Tests.swift
//  ContactList_SwiftUITests
//
//  Created by Luciano Puzer on 13/02/22.
//

import XCTest
@testable import ContactList_SwiftUI

class ContactListViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    func test_fetchContacts_ShouldReturnArrayNotNil() async throws {
        let vm = ContactListViewModel()
        let contact: () = try await vm.fetchContacts()
        XCTAssertNotNil(contact)
    }
    

}
