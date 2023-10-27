//
//  AddPartyView.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI

struct AddPartyView: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var viewModel = AddPartyViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("green"))
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("green"))
                                    .font(.system(size: 15, weight: .regular))
                            }
                            
                        })
                        
                        Spacer()

                    }
                                            
                        Text("Add a party")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    
                }
                .padding(.vertical)
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Date")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                                    
                            DatePicker("Departure", selection: $viewModel.createDate, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Time")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                                    
                            DatePicker("Arrival", selection: $viewModel.createTime, in: Date()..., displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))

                        }

                    }
                    .padding(.bottom)
                    
                    Group(content: {
                        
                        Text("Title")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text(" ")
                                    .foregroundColor(viewModel.partyTitle.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.partyTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.partyTitle)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                        
                        Text("Location")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text(" ")
                                    .foregroundColor(viewModel.partyLocation.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.partyLocation.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.partyLocation)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                        .padding(.bottom)
                    })
                    
                    Text("Donation amount")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text(" ")
                                .foregroundColor(viewModel.partySum.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.partySum.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.partySum)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .padding(.bottom)
                    
                    
                    Text("Description")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text(" ")
                                .foregroundColor(viewModel.partyDescription.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.partyDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.partyDescription)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    
                }
                
                Button(action: {
                    
                    viewModel.addParty(completion: {
                                                
                        viewModel.partyTitle.removeAll()
                        viewModel.partyLocation.removeAll()
                        viewModel.partyDescription.removeAll()
                        viewModel.partySum.removeAll()
                        
                        presentationMode.wrappedValue.dismiss()
                    })
                    
                }, label: {
                    
                    Text("Create forecast")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("green")))
                })
                .opacity(viewModel.partyTitle.isEmpty || viewModel.partyLocation.isEmpty ? 0.5 : 1)
                .disabled(viewModel.partyTitle.isEmpty || viewModel.partyLocation.isEmpty ? true : false)

            }
            .padding()
        }
    }
}

struct AddPartyView_Previews: PreviewProvider {
    static var previews: some View {
        AddPartyView()
    }
}
