//
//  SongListViewModel.swift
//  VaporSwiftUI
//
//  Created by Luciano Puzer on 11/02/22.
//

import SwiftUI

final class ContactListViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    func fetchContacts() async throws {
        let urlString =  Constants.baseURL + Endpoints.contacts
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let contactResponse: [Contact] = try await HttpClient.shared.fetch(url: url)
        DispatchQueue.main.async {
            self.contacts = contactResponse
        }
    }
    
    
    
    func delete(at offsets: IndexSet) {
        offsets.forEach { i in
            guard let contactId = contacts[i].id else {
                return
            }
            
            guard let url = URL(string: Constants.baseURL + Endpoints.contacts +
                                "/\(contactId)") else {
                return
            }
            Task {
                do {
                    try await HttpClient.shared.delete(at: contactId, url: url)
                } catch {
                    print ("error: \(error)")
                }
            }
        }
        contacts.remove(atOffsets: offsets)
    }
    
}
