//
//  FruitsAppApp.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI

@main
struct FruitsAppApp: App {
    
    @StateObject private var predictionStatus = PredictionStatus()
    @StateObject private var progressTracker = ProgressTracker()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TitleView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(predictionStatus)
            .environmentObject(progressTracker)
        }
    }
}
