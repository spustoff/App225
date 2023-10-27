//
//  RSplash.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct RSplash: View {
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
               Text("Keep a record of donations")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top)
                
                Text("Support your favorite political parties")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    RSplash2()
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

struct RSplash_Previews: PreviewProvider {
    static var previews: some View {
        RSplash()
    }
}
