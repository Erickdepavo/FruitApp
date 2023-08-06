//
//  Fruit+SwiftUI.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI

extension Fruit {
    
    var colorValue: Color {
        switch color {
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        case "yellow": return .yellow
        case "orange": return .orange
        case "purple": return .purple
        case "pink": return .pink
        case "teal": return .teal
        case "mint": return .mint
        case "indigo": return .indigo
        case "cyan": return .cyan
        case "gray", "grey": return .gray
        case "black": return .black
        case "white": return .white
        case "brown": return .brown
        default: return Color(color)
        }
    }
    
}

extension Fruit.Season {
    
    var name: String {
        switch self {
        case .spring:
            return "Spring"
        case .summer:
            return "Summer"
        case .fall:
            return "Fall"
        case .winter:
            return "Winter"
        case .none:
            return "All"
        }
    }
    
    var color: Color {
        switch self {
        case .spring:
            return .green
        case .summer:
            return .yellow
        case .fall:
            return .brown
        case .winter:
            return .mint
        case .none:
            return .secondary
        }
    }
    
    @ViewBuilder
    var image: some View {
        switch self {
        case .spring:
            Image(systemName: "camera.macro")
                .foregroundColor(self.color)
        case .summer:
            Image(systemName: "sun.max.fill")
                .foregroundColor(self.color)
        case .fall:
            Image(systemName: "leaf.fill")
                .foregroundColor(self.color)
        case .winter:
            Image(systemName: "snowflake")
                .foregroundColor(self.color)
        case .none:
            Image(systemName: "camera.macro")
                .foregroundColor(Self.spring.color)
            Image(systemName: "sun.max.fill")
                .foregroundColor(Self.summer.color)
            Image(systemName: "leaf.fill")
                .foregroundColor(Self.fall.color)
            Image(systemName: "snowflake")
                .foregroundColor(Self.winter.color)
        }
    }
    
}

struct Fruit_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 32) {
            ForEach(Fruit.Season.allCases, id: \.rawValue) { season in
                HStack(alignment: .center, spacing: 48) {
                    Text("Season")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .foregroundColor(.primary)
                    HStack(spacing: 8) {
                        Text(season.name)
                            .font(.system(.largeTitle, design: .rounded, weight: .medium))
                            .foregroundColor(season.color)
                        season.image
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    }
                }
            }
        }
    }
}
