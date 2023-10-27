//
//  MonthlyGoal.swift
//  App225
//
//  Created by IGOR on 25/10/2023.
//

import SwiftUI

struct MonthlyGoal: View {
    
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
                .padding()
                
                Text("Your monthly goal")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {

                    ZStack(alignment: .leading, content: {
                        
                        Text(" ")
                            .foregroundColor(viewModel.mg.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.mg.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.mg)
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
                
                Spacer()
                
                Button(action: {
                                        
                    viewModel.monthly_goal += Int(viewModel.mg) ?? 0
                    viewModel.mg = ""
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("green")))
                })
                .opacity(viewModel.mg.isEmpty ? 0.5 : 1)
                .disabled(viewModel.mg.isEmpty ? true : false)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct MonthlyGoal_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyGoal()
    }
}
