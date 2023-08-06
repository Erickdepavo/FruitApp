//
//  ClassifierViewModel.swift
//  coreML-starter
//
//
//

import Foundation

final class ClassifierViewModel: ObservableObject {
    @Published var classifierData: [Fruit] = []
    @Published var dataWhenAboutTapped:Int = 0
    @Published var classifierLabels: [String: Bool] = [:]

    
    func loadJSON() {
        print("load JSON")
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                classifierData = try decoder.decode([Fruit].self, from: jsonData)
                
                for labelData in classifierData {
                    classifierLabels[labelData.label] = false
                }
                
            } catch {
                print(error)
            }
        } else {
            print("could not find data")
        }
 
    }
    
    func getPredictionData(label: String) -> Fruit {
        return classifierData.filter { $0.label == label }.first ?? Fruit()
    }
}
