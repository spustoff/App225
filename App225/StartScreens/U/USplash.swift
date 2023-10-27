//
//  USplash.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct USplash: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
               Text("A new perspective on finance")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top)
                
                Text("Your best opportunity for growth")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                        .padding()
                })
            }
        }
    }
}

struct USplash_Previews: PreviewProvider {
    static var previews: some View {
        USplash(telegram: URL(string: "h")!, isTelegram: false)
    }
}
