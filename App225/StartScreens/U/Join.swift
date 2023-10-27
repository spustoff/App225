//
//  Join.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
               Text("Join our Telegram Channel")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top)
                
                Text("And trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Image("Join")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                        .padding()
                })
            }

            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.white.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(telegram: URL(string: "h")!)
    }
}
