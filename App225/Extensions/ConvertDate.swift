//
//  ConvertDate.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
