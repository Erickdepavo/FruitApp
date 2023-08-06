//
//  ProgressTracker.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 06/08/23.
//

import Foundation
import Combine

class ProgressTracker: ObservableObject {
    
    @Published private var fruitsInCollection: Set<String> = ProgressTracker.getFromCache()
    
    let allFruits: [Fruit]
    
    init() {
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let list = try decoder.decode([Fruit].self, from: jsonData)
                
                allFruits = list.filter({ $0.label != "Unknown" })
            } catch {
                fatalError("parse error: " + error.localizedDescription)
            }
        } else {
            fatalError("could not find data")
        }
    }
    
    static private func getFromCache() -> Set<String> {
        return ["Banana", "Grapes", "Grapefruit", "Lemon"]
    }
    
    private func saveToCache() {
        
    }
    
    
    func addFruit(_ fruit: Fruit) {
        fruitsInCollection.insert(fruit.label)
    }
    
    func isFruitInCollection(_ fruit: Fruit) -> Bool {
        fruitsInCollection.contains(fruit.label)
    }
    
}
