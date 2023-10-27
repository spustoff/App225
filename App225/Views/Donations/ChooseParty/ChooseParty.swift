//
//  ChooseParty.swift
//  App225
//
//  Created by IGOR on 25/10/2023.
//

import SwiftUI

struct ChooseParty: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var viewModel = DonationsViewModel()
    
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
                    
                    Text("Goal")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.parties.isEmpty {
                        
                        VStack {
                            
                            Image("EP")
                                .padding()
                            
                            Text("You haven't added any more parties")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                                .padding()
                            
                            Text("Add a new Party on the second Parties tab in the tab bar")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.parties, id: \.self) { index in
                                    
                                    NavigationLink(destination: {
                                        
                                        AddDonation()
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Image("usa")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.trailing)
                                                
                                                Text(index.partyTitle ?? "")
                                                    .foregroundColor(.white)
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                    })
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear{
            
            viewModel.fetchParties()
        }
    }
}

struct ChooseParty_Previews: PreviewProvider {
    static var previews: some View {
        ChooseParty()
    }
}
