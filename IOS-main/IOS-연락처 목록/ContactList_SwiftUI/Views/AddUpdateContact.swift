//
//  AddUpdateContact.swift
//  VaporSwiftUI
//
//  Created by Luciano Puzer on 11/02/22.
//

import SwiftUI

struct AddUpdateContact: View {
    @ObservedObject var vm: AddUpdateContactsViewModel
    var pickColorTable:[GridItem] = Array(repeating: .init(.flexible(), spacing: 1), count: 3)
    @Environment(\.presentationMode) var presentationMode
    @State var backgroundColorBox:String = "White1"
    @State var fontColorBox:String = "Black1"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("mainBackground")
                    .ignoresSafeArea()
                VStack{
                    Text("Enter your contact information")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .padding()
                        .padding(.bottom, -8)

                    VStack(alignment: .center) {
                    TextField("Name", text: $vm.contactName)
                        .font(.title2)
                        .foregroundColor(Color(fontColorBox))
                        .frame(width: 300, height: 30, alignment: .leading)

                    TextField("Phone", value:  $vm.contactPhone, formatter: NumberFormatter())
                        .foregroundColor(Color(fontColorBox))
                        .font(.title3)
                        .frame(width: 300, height: 30, alignment: .leading)

                    }.frame(width: geometry.size.width*0.95, height: geometry.size.height/8, alignment: .center)
                        .background(Color(backgroundColorBox))
                        .cornerRadius(20)

                    VStack{
                    Text("Choose the card colors")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .padding(.top, 15)
                        .padding(.bottom, -8)

                    HStack{
                        Spacer()
                        VStack {
                            Text("Background Color")
                            ScrollView {
                                LazyVGrid(columns: pickColorTable, spacing: 1) {
                                    ForEach(vm.mainColorTable, id: \.self) { color in
                                        Rectangle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color(color))
                                            .cornerRadius(5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                self.vm.contactBackcolor = color
                                                self.backgroundColorBox = color
                                            }
                                    }
                                }
                            }.frame(width: 100, height: 100)
                        }.frame(width: 150, height: 150)
                            .foregroundColor(
                                backgroundColorBox == "Black1" ? (.white) : (.black))
                        
                            .background(Color(backgroundColorBox))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                        Spacer()
                        VStack {
                            Text("Font Color")
                            ScrollView {
                                LazyVGrid(columns: pickColorTable, spacing: 1) {
                                    ForEach(vm.mainColorTable, id: \.self) { color in
                                        Rectangle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color(color))
                                            .cornerRadius(5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            )
                                            .onTapGesture {
                                                self.vm.contactFontcolor = color
                                                self.fontColorBox = color
                                            }
                                    }
                                }
                            }.frame(width: 100, height: 100)
                        }.frame(width: 150, height: 150)
                            .foregroundColor(
                                fontColorBox == "Black1" ? (.white) : (.black))
                            .background(Color(fontColorBox))
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Spacer()
                        
                    }.padding()
                }
                    
                    Button {
                        vm.addUpdateAction {
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text(vm.buttonName)
                    }
                }
            }
        }
    }
}


struct AddUpdateContact_Previews: PreviewProvider {
    static var previews: some View {
        AddUpdateContact(vm: AddUpdateContactsViewModel())
    }
}
