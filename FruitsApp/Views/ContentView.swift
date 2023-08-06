//
//  ContentView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        ClassificationView(classifierViewModel: classifierViewModel) {
            MainView(
                labelData: classifierViewModel.getPredictionData(label: predictionStatus.topLabel),
                classifierViewModel: classifierViewModel
            )
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
