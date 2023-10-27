//
//  DonationsView.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct DonationsView: View {
    
    @StateObject var viewModel = DonationsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Donations")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            AddDonation()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("+")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 28, weight: .medium))
                        })
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(viewModel.months, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.current_month = index
                                
                            }, label: {
                                
                                VStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                    Text("2023")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                }
                            })
                            .frame(width: 50, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color("green"), lineWidth: 2).opacity(viewModel.current_month == index ? 1 : 0))
                            .padding(3)
                        }
                    }
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        
                        Text("Your monthly goal")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isGoal = true
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 18, weight: .medium))
                            
                        })
                    }
                    
                    GeometryReader { reader in
                        
                        let result = CGFloat((CGFloat(Int(viewModel.monthly_goal) ) * reader.size.width)) / CGFloat(5000)
                        
                        ZStack(alignment: .leading, content: {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.2))
                                .frame(width: reader.size.width, height: 10)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("green"))
                                .frame(width: result, height: 10)
                        })
                    }
                    .frame(height: 10)
                    .padding(.top)
                    
                    HStack {
                        
                        Text("$\(viewModel.monthly_goal)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Text("$5000")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                .padding()
                
                if viewModel.parties.isEmpty {
                    
                    VStack {
                        
                        Image("EP")
                            .padding()
                        
                        Text("You haven't added any more parties")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .semibold))
                            .padding([.horizontal, .top])
                        
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
                                    
                                    Text("$\(index.partySum)")
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
        .onAppear{
            
            viewModel.fetchParties()
        }
        .sheet(isPresented: $viewModel.isGoal, content: {
            
            MonthlyGoal()
        })
    }
}

struct DonationsView_Previews: PreviewProvider {
    static var previews: some View {
        DonationsView()
    }
}
