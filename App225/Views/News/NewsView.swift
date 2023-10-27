//
//  NewsView.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("News")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                 
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            AddPartyView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("+")
                                .foregroundColor(Color("green"))
                                .font(.system(size: 26, weight: .semibold))
                        })
                        .disabled(true)
                        .opacity(0)
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        
                        Text("Your goal is to see the news")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(Color("green"))
                            .font(.system(size: 18, weight: .semibold))
                        
                    }
                    
                    GeometryReader { reader in
                        
                        let result = CGFloat((CGFloat(viewModel.news_goal) * reader.size.width)) / CGFloat(100)
                        
                        ZStack(alignment: .leading, content: {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.2))
                                .frame(width: reader.size.width, height: 10)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("green"))
                                .frame(width: result, height: 10)
                        })
                    }
                    .frame(height: 10)
                    .padding(.top)
                    
                    HStack {
                        
                        Text("\(viewModel.news_goal)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                        Spacer()
                        
                        Text("100")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                .padding(.vertical)
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.papers, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                WebPic(urlString: index.resultImage ?? "", width: .infinity, height: 125, cornerRadius: 10, isPlaceholder: false)
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    
                                    Text("\(index.resultDateTime ?? "")")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text(index.resultTitle ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                    
                                    HStack {
                                                
                                                Image(systemName: "hand.thumbsup")
                                                    .foregroundColor(Color("green"))
                                                    .font(.system(size: 15, weight: .regular))
     
                                        Text("\(String(format: "%2.f", viewModel.likes))")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Spacer()
                    
                                    }
                                    .padding(5)
                                }
                            }
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                        }
                    })
                    .padding(.horizontal)
                }

            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {

            viewModel.getNews()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
