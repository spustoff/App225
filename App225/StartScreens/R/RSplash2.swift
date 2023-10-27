//
//  RSplash2.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct RSplash2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
               Text("Read the actual news")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top)
                
                Text("And communicate about it")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    RSplash3()
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

struct RSplash2_Previews: PreviewProvider {
    static var previews: some View {
        RSplash2()
    }
}
