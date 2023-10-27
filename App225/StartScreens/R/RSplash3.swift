//
//  RSplash3.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct RSplash3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
               Text("Make your predictions")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top)
                
                Text("Based on the news and see how accurate you are in this case")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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

struct RSplash3_Previews: PreviewProvider {
    static var previews: some View {
        RSplash3()
    }
}
