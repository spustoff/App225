//
//  AddDonation.swift
//  App225
//
//  Created by IGOR on 25/10/2023.
//

import SwiftUI

struct AddDonation: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var viewModel = AddPartyViewModel()
        
//    var index: String
//    var news: NewsItem
    
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
                                    .foregroundColor(.blue)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 15, weight: .regular))
                            }
                            
                        })
                        
                        Spacer()

                    }
                                            
                        Text("Select currency")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    
                }
                .padding()
                .padding(.top)
                
                TradeChart(pair: viewModel.selected_valut)
                    .disabled(true)
                
                Spacer()

                HStack {
                    
                    Button(action: {
                        
                        if viewModel.time < 0 {
                            
                            viewModel.resultText = "Not enough money"
                            
                        } else {
                            
                            viewModel.timer_sys_start()
                        }
                        
                    }, label: {

                            Text("UP")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))

                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                    
                    Spacer()
                    
                    Text("or")
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .regular))
                    
                    Button(action: {
                        
                        if viewModel.time < 0 {
                            
                            viewModel.resultText = "Not enough money"
                            
                        } else {
                            
                            viewModel.timer_sys_start()
                        }
                        
                    }, label: {
        
                            Text("DOWN")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))

                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                }
                .padding(.horizontal)
                .opacity(viewModel.isRunned ? 0.5 : 1)
                
                Menu {

                    ForEach(viewModel.valuts, id: \.self) { index in

                        Button(action: {

                            viewModel.selected_valut = index

                        }, label: {

                            HStack {

                                Text(index)
                                    .foregroundColor(.black)

                                Spacer()

                                if viewModel.selected_valut == index {

                                    Image(systemName: "xmark")
                                        .foregroundColor(.black)
                                }
                            }
                        })
                    }

                } label: {
                    
                    HStack {
                        
                        Text(viewModel.selected_valut)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                     
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                .padding(.horizontal)
                
                NavigationLink(destination: {
                    
                    AddPartyView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                        .padding(.horizontal)
                })
                .padding(.bottom)
                
            }
        }
//        .sheet(isPresented: $viewModel.isProfit, content: {
//
//            AddProfitView(viewModel: viewModel, index: news)
//        })
        .onReceive(viewModel.timer_sys, perform: { _ in
            
            if viewModel.isRunned {
                
                if viewModel.time > 0 {
                    
                    viewModel.time -= 1
                    
                } else {
                    
                    viewModel.timer_sys_stop()
                }
            }
        })
        .disabled(viewModel.isRunned ? true : false)
        .overlay (
        
            ZStack {
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("\(viewModel.resultText)")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("blue")))
                }
            }
                .opacity(viewModel.resultText.isEmpty ? 0 : 1)
        )
        .onChange(of: viewModel.isProfit, perform: { update in
            
            if update == false {
                
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}


struct AddDonation_Previews: PreviewProvider {
    static var previews: some View {
        AddDonation()
    }
}
