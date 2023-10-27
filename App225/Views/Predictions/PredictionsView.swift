//
//  PredictionsView.swift
//  App225
//
//  Created by IGOR on 25/10/2023.
//

import SwiftUI

struct PredictionsView: View {
    
    @StateObject var viewModel = PredictionsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Predictions")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            
                            Text("+")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 24, weight: .regular))
                        })
                        .disabled(true)
                        .opacity(0)
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        
                        Text("Your monthly goal")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isPred = true
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 18, weight: .medium))
                            
                        })
                    }
                    
                    GeometryReader { reader in
                        
                        let result = CGFloat((CGFloat(Int(viewModel.success_pred) ) * reader.size.width)) / CGFloat(100)
                        
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
                        
                        Text("\(viewModel.success_pred)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Text("100")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                .padding(.vertical)
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
                                        
                                        HStack(spacing: 10) {
                                            
                                            Button(action: {
                                                
                                                viewModel.like.toggle()
                                                
                                            }, label: {
                                                
                                                Image(systemName: viewModel.like == true ? "hand.thumbsup.fill" : "hand.thumbsup")
                                                    .foregroundColor(viewModel.like == true ? Color("green") : .gray)
                                                    .font(.system(size: 17, weight: .regular))
                                            })
                                            
                                            Button(action: {
                                                
                                                viewModel.dislike.toggle()
                                                
                                            }, label: {
                                                
                                                Image(systemName: viewModel.dislike == true ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                                                    .foregroundColor(viewModel.dislike == true ? Color("green") : .gray)
                                                    .font(.system(size: 17, weight: .regular))
                                            })
                                            
                                            Spacer()
                                        }

                                    }
                                    
                                    VStack {
                                        
                                        if viewModel.chance == true {
                                            
                                            Button(action: {
                                                
                                                viewModel.chance.toggle()
                                                
                                            }, label: {
                                                
                                                Text("Lose")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 16, weight: .regular))
                                                    .padding(.bottom)
                                                
                                            })
             
                                        } else {
                                            
                                            Button(action: {
                                                
                                                viewModel.chance.toggle()
                                                
                                            }, label: {
                                                
                                                Text("Win")
                                                    .foregroundColor(Color("green"))
                                                    .font(.system(size: 16, weight: .regular))
                                                    .padding(.bottom)
                                                
                                            })
                                        }
                                        
                                        Text("$\(String(format: "%.2f", Double(.random(in: 2000...10000))))")
                                            .foregroundColor(.white)
                                    }
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
        .sheet(isPresented: $viewModel.isPred, content: {
            
            SP()
        })
        .onAppear{
            
            viewModel.fetchParties()
        }
    }
}

struct PredictionsView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionsView()
    }
}
