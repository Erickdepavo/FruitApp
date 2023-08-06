//
//  Fruit.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import Foundation

struct Fruit {
    var label: String = "Unknown"
    var name: String = ""
    var color: String = "gray"
    
    var season: Season = .none
    var sunlight: Int = 5
    var water: Int = 5
    
    var funfact: String = "No description."
    var benefits: [Benefit] = [.init()]
    var origin: Origin = .init()
    
    var video: String? = nil
    
    static let defaultVideo = "https://www.youtube.com/embed/kGMWZrYCreo"
    
    enum Season: String, Codable, CaseIterable {
        case spring, summer, fall, winter, none
    }
    
    struct Benefit {
        var symbol: String = "xmark"
        var title: String = "Generic Benefit"
        var description: String = "No description."
    }
    
    struct Origin {
        var latitude: Double = 0.0
        var longitude: Double = 0.0
        var span: Double = 10
        var place: String = ""
    }
}

extension Fruit: Identifiable, Codable {
    var id: String { label }
}
extension Fruit.Benefit: Identifiable, Codable {
    var id: String { title }
}
extension Fruit.Origin: Codable {}

//[
//    {
//        "label": "",
//        "name": "",
//        "color": "pink",
//        "season": "none",
//        "sunlight": 5,
//        "water": 5,
//        "funfact": "",
//        "benefits": [
//            {
//                "symbol": "",
//                "title": "",
//                "description": ""
//            },
//        ],
//        "origin": {
//            "latitude": 0.000,
//            "longitude": 0.000,
//            "span": 15
//        }
//    }
//]
