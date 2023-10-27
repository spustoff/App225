//
//  Not.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
               Text("Don't miss anything important")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(.top)
                
                Text("Get the most up-to-date information")
                    .foregroundColor(.gray)
                    .font(.system(size: 15, weight: .regular))
                
                Spacer()
                
                Image("Not")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                        
                        print("User accepted notifications: \(accepted)")
                        
                    }, fallbackToSettings: true)
                    
                    status = true

                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("green")))
                        .padding()
                })
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.white.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
            .padding(.top, 40)
        }
    }
}

struct Not_Previews: PreviewProvider {
    static var previews: some View {
        Not()
    }
}
