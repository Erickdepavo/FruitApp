//
//  MainView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 06/08/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var progressTracker: ProgressTracker
    
    private(set) var labelData: Fruit
    @ObservedObject var classifierViewModel: ClassifierViewModel
    
    @State private var labelDataForModal: Fruit? = nil
    @State private var showsCollection = false
    
    var fruitForView: Fruit? {
        labelData.id == "Unknown" ? nil : labelData
    }
    
    var body: some View {
        FruitScanOverlayView(
            fruitFound: fruitForView,
            didTapCollection: didTapCollection,
            didTapOpen: didTapOpen(fruit:)
        )
        .sheet(item: $labelDataForModal, onDismiss: { labelDataForModal = nil }) { fruit in
            FruitInfoModalView(fruit: fruit, comesFromScan: true)
        }
        .sheet(isPresented: $showsCollection, onDismiss: { showsCollection = false }) {
            FruitCollectionView()
                .environmentObject(progressTracker)
        }
    }
    
    func didTapCollection() {
        showsCollection = true
    }
    
    func didTapOpen(fruit: Fruit) {
        progressTracker.addFruit(fruit)
        labelDataForModal = fruit
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(labelData: .orange, classifierViewModel: .init())
            .background {
                Image("Kitchen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
    }
}
