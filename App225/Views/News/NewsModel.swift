//
//  NewsModel.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI

struct NewsModel: Codable, Hashable {

    var results: [NewsItem]
}

struct NewsItem: Codable, Hashable {
    
    var resultId: Int?
    
    var resultTitle: String?
    var resultImage: String?
    
    var resultMark: String?
    var resultDateTime: String?
    
    var resultText: String?
    
    var resultTotalLikes: Int?
    var resultTotalComments: Int?
}
