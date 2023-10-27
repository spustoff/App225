//
//  DonationsViewModel.swift
//  App225
//
//  Created by IGOR on 24/10/2023.
//

import SwiftUI
import CoreData

final class DonationsViewModel: ObservableObject {
    
    @Published var months: [String] = ["Jun", "Jul", "Aug", "Sep","Oct", "Nov", "Dec"]
    @Published var current_month = "Oct"
    
    @AppStorage("monthly_goal") var monthly_goal: Int = 0
    
    @Published var mg: String = ""
    
    @Published var current_history: PartyModel?
    @Published var parties: [PartyModel] = []
    @Published var isDetail: Bool = false
    @Published var isFavs: Bool = false
    @Published var isGoal: Bool = false
    
    @AppStorage("donations") var donations: Int = 0
    
    func fetchParties() {
        
        CoreDataStack.shared.modelName = "PartyModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PartyModel>(entityName: "PartyModel")
        
        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.parties = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.parties = []
        }
    }
}
