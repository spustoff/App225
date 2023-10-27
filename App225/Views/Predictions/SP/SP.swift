//
//  SP.swift
//  App225
//
//  Created by IGOR on 25/10/2023.
//

import SwiftUI

struct SP: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var viewModel = PredictionsViewModel()
    
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
                .padding()
                
                VStack(alignment: .leading, content: {
                    
                    Text("Your successful predictions")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {

                        ZStack(alignment: .leading, content: {
                            
                            Text(" ")
                                .foregroundColor(viewModel.sp.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.sp.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.sp)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)

                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("green")))
                    .padding(2)
                    .padding(.bottom)
                    
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                                        
                    viewModel.success_pred += Int(viewModel.sp) ?? 0
                    viewModel.sp = ""
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("green")))
                        .padding()
                })
                .opacity(viewModel.sp.isEmpty ? 0.5 : 1)
                .disabled(viewModel.sp.isEmpty ? true : false)
            }
        }
    }
}

struct SP_Previews: PreviewProvider {
    static var previews: some View {
        SP()
    }
}
