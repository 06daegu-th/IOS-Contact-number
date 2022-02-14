//
//  AddUpdateContactsViewModel.swift
//  VaporSwiftUI
//
//  Created by Luciano Puzer on 11/02/22.
//

import SwiftUI

final class AddUpdateContactsViewModel: ObservableObject {
    @Published var contactName = ""
    @Published var contactPhone:Int?
    @Published var contactFontcolor = ""
    @Published var contactBackcolor = ""
    var contactId: UUID?

    var isUpadating: Bool {
        contactId != nil
    }
    
    var buttonName: String {
        contactId != nil ? "Update Contact" : "Add Contact"
    }
    
    @Published var mainColorTable = [
        "Blue1",
        "Blue2",
        "Green1",
        "Green2",
        "Purple1",
        "Yellow1",
        "Red1",
        "White1",
        "Black1"
        ]
    
    init() {}
    
    init(currentContact: Contact) {
        self.contactName = currentContact.name
        self.contactPhone = currentContact.phone
        self.contactBackcolor = currentContact.backcolor
        self.contactFontcolor = currentContact.fontcolor
        self.contactId = currentContact.id
    }
    
    
    func addContact() async throws {
        let urlString =  Constants.baseURL + Endpoints.contacts
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let contact = Contact(
            id: nil,
            name: contactName,
            phone: contactPhone ?? 0,
            backcolor: contactBackcolor,
            fontcolor: contactFontcolor)
        
        try await HttpClient.shared.sendData(to: url,
                                             object: contact,
                                             httpMethod: HttpMethods.POST.rawValue)
    }
    
    
    
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            do {
                if isUpadating {
                   try await updateContact()
                    
                } else {
                    try await addContact()
                }
            } catch {
                print("Erros: \(error)")
            }
            completion()
        }
    }
    
    
    
    func updateContact() async throws {
        let urlString =  Constants.baseURL + Endpoints.contacts
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let contactToUpadate = Contact(
            id: contactId,
            name: contactName,
            phone: contactPhone ?? 0,
            backcolor: contactBackcolor,
            fontcolor: contactFontcolor
        )
        
        try await HttpClient.shared.sendData(to: url,
                                             object: contactToUpadate,
                                             httpMethod: HttpMethods.PUT.rawValue)
    }
    
    
    
}
