//
//  ContentView.swift
//  ContactList_SwiftUI
//
//  Created by Luciano Puzer on 12/02/22.
//

import SwiftUI

struct ContactListView: View {
    @StateObject var vm = ContactListViewModel()
    @State var modal: ModalType? = nil
    @State var showOptions:Bool = false
    @State var selectedContact:Contact?
    init(){
        UITableView.appearance().backgroundColor = UIColor(named: "mainBackground")
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Color("mainBackground")
                        .ignoresSafeArea()
                    VStack {
                        List {
                            ForEach (vm.contacts){ contact in
                                ZStack {
                                    VStack (alignment: .leading, spacing: 5){
                                        
                                        Text(contact.name)
                                            .foregroundColor(Color(contact.fontcolor))
                                            .font(.title2)
                                            .frame(width: 300, height: 30, alignment: .leading)
                                        Text(String(contact.phone))
                                            .font(.title3)
                                            .foregroundColor(Color(contact.fontcolor))
                                            .frame(width: 300, height: 30, alignment: .leading)
                                        
                                    }.frame(width: geometry.size.width*0.8, height: geometry.size.height/8)
                                        .background(Color(contact.backcolor))
                                        .cornerRadius(20)
                                        
                                    
                                    Button(action: {
                                        self.showOptions.toggle()
                                        self.selectedContact = contact
                                    }, label: {
                                        Image(systemName: "gearshape" )
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color(contact.fontcolor))
                                            .offset(x: 130, y: -20)
                                    }).accessibilityIdentifier("gearButton")
                                        .actionSheet(isPresented: $showOptions) {
                                            ActionSheet(title: Text("Select an option"), message: nil, buttons: [
                                                .default(Text("Edit"),
                                                         action: {
                                                             modal = .update(self.selectedContact ?? contact)
                                                         }),
                                                .cancel()
                                            ])
                                        }
                                }.listRowBackground(Color("mainBackground"))
                                    .listRowSeparator(.hidden)
                            }.onDelete(perform: vm.delete)
                        }
                        .frame(width: geometry.size.width)
                      //  .navigationTitle(Text("Contact List"))
                        
                        .toolbar{
                            Button {
                                modal = .add
                            } label: {
                                Label("Add Contact", systemImage: "plus.circle")
                            }
                        }.navigationBarTitle("ContactList")
                    }.padding()
                }
            }
            .sheet(item: $modal, onDismiss: {
                Task {
                    do {
                        try await vm.fetchContacts()
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }) { modal in
                switch modal {
                case .add:
                    AddUpdateContact(vm: AddUpdateContactsViewModel())
                    
                case .update(let contact):
                    AddUpdateContact(vm: AddUpdateContactsViewModel(currentContact: contact))
                }
            }
            .onAppear {
                Task {
                    do{
                        try await vm.fetchContacts()
                    }
                    catch{
                        print("Error: \(error)")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
