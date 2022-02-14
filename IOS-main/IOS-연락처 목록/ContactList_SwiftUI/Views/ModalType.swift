//
//  ModalType.swift
//  VaporSwiftUI
//
//  Created by Luciano Puzer on 11/02/22.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
    
    switch self {
    case .add: return "add"
    case .update: return "update"
    }
}


case add
case update(Contact)

}
