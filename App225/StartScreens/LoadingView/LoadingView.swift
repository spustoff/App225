//
//  LoadingView.swift
//  App225
//
//  Created by IGOR on 23/10/2023.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            ProgressView()
                .padding()
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
