//
//  NewsViewModel.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI
import Alamofire

final class NewsViewModel: ObservableObject {
        
    @Published var likes: Int = 0
    
    @AppStorage("news_goal") var news_goal: Int = 0

    @Published var isLoading: Bool = false
    
    @Published var papers: [NewsItem] = []
    
    @Published var isDetail: Bool = false
    @Published var selectedPaper: NewsItem?
    
    @AppStorage("readed") var readed: Int = 0
    
    
    func fetchNews(completion: @escaping (Result<NewsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "bf86abfb-35b0-4f00-9d2b-046a859e70bb",
        ]
        
        let request = AF.request("https://nuterop.space/api/v2/news", method: .get, parameters: params)
        
        request.responseDecodable(of: NewsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
    
    func getNews() {
        
        isLoading = true
        
        self.fetchNews { result in
            
            switch result {
                
            case .success(let success):
                
                self.papers = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
}

