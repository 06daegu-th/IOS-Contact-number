//
//  Contact.swift
//  ContactList_SwiftUI
//
//  Created by Luciano Puzer on 12/02/22.
//

import Foundation

import Foundation

struct Contact: Identifiable, Codable {
    
    let id: UUID?
    let name: String
    let phone: Int
    let backcolor: String
    let fontcolor: String
    
}
