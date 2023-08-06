//
//  FruitInfoPageView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI
import MapKit

struct FruitInfoPageView: View {
    let fruit: Fruit
    
    var body: some View {
        ScrollView {
            VStack(spacing: 64) {
                HStack(alignment: .center, spacing: 48) {
                    Text("Season")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .foregroundColor(.primary)
                    HStack(spacing: 8) {
                        Text(fruit.season.name)
                            .font(.system(.largeTitle, design: .rounded, weight: .medium))
                            .foregroundColor(fruit.season.color)
                            .fixedSize(horizontal: true, vertical: false)
                        fruit.season.image
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    }
                }
                Grid(horizontalSpacing: 16, verticalSpacing: 24) {
                    GridRow {
                        Text("Necessary Sunlight")
                            .font(.system(.title2, design: .rounded, weight: .medium))
                            .padding(.horizontal, 16)
                            .gridColumnAlignment(.trailing)
                        ForEach(0..<5) { i in
                            Image(systemName: "sun.max.fill")
                                .font(.largeTitle)
                                .foregroundColor(i < fruit.sunlight ? .yellow : .secondary)
                                .opacity(i < fruit.sunlight ? 1 : 0.2)
                        }
                    }
                    GridRow {
                        Text("Necessary Water")
                            .font(.system(.title2, design: .rounded, weight: .medium))
                            .padding(.horizontal, 16)
                            .gridColumnAlignment(.trailing)
                        ForEach(0..<5) { i in
                            Image(systemName: "drop.fill")
                                .font(.largeTitle)
                                .foregroundColor(i < fruit.water ? .teal : .secondary)
                                .opacity(i < fruit.water ? 1 : 0.2)
                        }
                    }
                }
                VStack(spacing: 20) {
                    Text("Crop")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .foregroundColor(.primary)
                    Image(fruit.label + "Crop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .mask({ RoundedRectangle(cornerRadius: 16, style: .continuous) })
                        .padding(.horizontal, 64)
                }
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 32)
        }
    }
}

struct FruitInfoPageView_Previews: PreviewProvider {
    
    static var body: some View {
        Image("Kitchen")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .sheet(isPresented: .constant(true)) {
                FruitInfoModalView(fruit: .orange, comesFromScan: true, initialPage: 1)
            }
            
    }
    
    static var previews: some View {
        body
            .previewInterfaceOrientation(.portrait)
            .previewDisplayName("Portrait")
        body
            .previewInterfaceOrientation(.landscapeRight)
            .previewDisplayName("Landscape")
    }
}
