//
//  MockData.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import Foundation

extension Fruit {
    static let orange = Fruit(
        label: "Orange",
        name: "Orange",
        color: "orange",
        season: .none,
        sunlight: 5,
        water: 3,
        funfact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam orci, placerat eu turpis vel, imperdiet congue massa.",
        benefits: [
            .init(symbol: "bolt.fill", title: "Lorem ipsum dolor", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam orci, placerat eu turpis vel, imperdiet congue massa."),
            .init(symbol: "eyes.inverse", title: "Praesent faucibus magna", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam, placerat eu turpis vel, imperdiet congue massa."),
            .init(symbol: "figure.walk", title: "Quisque eget est rhoncus", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam orci, eu turpis vel, imperdiet congue massa."),
        ],
        origin: .init(
            latitude: 23.77552,
            longitude: -102.57254,
            span: 20
        )
    )
    static let grapefruit = Fruit(
        label: "Grapefruit",
        name: "Grapefruit",
        color: "pink",
        season: .spring,
        sunlight: 3,
        water: 4,
        funfact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam orci, placerat eu turpis vel, imperdiet congue massa.",
        benefits: [
            .init(symbol: "bolt.fill", title: "Lorem ipsum dolor", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam orci, placerat eu turpis vel, imperdiet congue massa."),
            .init(symbol: "eyes.inverse", title: "Praesent faucibus magna", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam, placerat eu turpis vel, imperdiet congue massa."),
            .init(symbol: "figure.walk", title: "Quisque eget est rhoncus", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quam orci, eu turpis vel, imperdiet congue massa."),
        ],
        origin: .init(
            latitude: 23.77552,
            longitude: -102.57254,
            span: 20
        )
    )
}
