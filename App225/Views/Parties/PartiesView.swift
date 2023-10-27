//
//  PartiesView.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI

struct PartiesView: View {
    
    @StateObject var viewModel = PartiesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Parties")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                 
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            AddPartyView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("+")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 26, weight: .semibold))
                        })
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Your total donations")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$\(viewModel.donations)")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                .padding(.bottom)
                .padding(.horizontal)
                
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
                                
                                HStack {
                                    
                                    Image("usa")
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Text(index.partyLocation ?? "")
                                            .foregroundColor(.gray)
                                        
                                        Text(index.partyTitle ?? "")
                                            .foregroundColor(.white)
                                        
                                        Text(index.partyDescription ?? "")
                                            .foregroundColor(.gray)
                                            .padding(.trailing)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("$\(String(format: "%.2f", Double(.random(in: 2000...10000))))")
                                        .foregroundColor(.white)
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            viewModel.fetchParties()
        }
    }
}

struct PartiesView_Previews: PreviewProvider {
    static var previews: some View {
        PartiesView()
    }
}
