//
//  FruitCollectionView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 06/08/23.
//

import SwiftUI

struct FruitCollectionView: View {
    
    @EnvironmentObject private var progressTracker: ProgressTracker
    
    @State private var labelDataForModal: Fruit? = nil
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                VStack(alignment: .center, spacing: 32) {
                    Text("My Collection")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .foregroundColor(.primary)
                    LazyVGrid(
                        columns: [.init(.adaptive(minimum: 300), spacing: 16, alignment: nil)],
                        spacing: 16
                    ) {
                        ForEach(progressTracker.allFruits) { fruit in
                            let isFound = progressTracker.isFruitInCollection(fruit)
                            
                            Button(
                                action: {
                                    if isFound {
                                        labelDataForModal = fruit
                                    }
                                }
                            ) {
                                VStack(alignment: .center, spacing: 24) {
                                    Image(fruit.label)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 150)
                                        .grayscale(isFound ? 0 : 1)
                                    Text(fruit.label)
                                        .font(.system(.title, design: .rounded, weight: .bold))
                                        .foregroundColor(isFound ? fruit.colorValue : .secondary)
                                }
                                .frame(maxWidth: .infinity)
                                    .padding(.vertical, 24)
                                    .padding(.horizontal, 32)
                                    .blur(radius: isFound ? 0 : 10)
                                    .font(.system(.body, design: .rounded, weight: .semibold))
                                    .background(Material.regular, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                            }
                        }
                    }
                }
                .padding(.vertical, 64)
                .padding(.horizontal, 32)
            }
            CloseButton()
        }
        .accentColor(.secondary)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(item: $labelDataForModal, onDismiss: { labelDataForModal = nil }) { fruit in
            FruitInfoModalView(fruit: fruit, comesFromScan: false)
        }
    }
}

struct FruitCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCollectionView()
            .environmentObject(ProgressTracker())
    }
}
