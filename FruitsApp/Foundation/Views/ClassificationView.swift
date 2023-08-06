//
//  ClassificationView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct ClassificationView<Content: View>: View {
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @ObservedObject var classifierViewModel: ClassifierViewModel
    
    let content: () -> Content
    
    var body: some View {
//        let predictionLabel = predictionStatus.topLabel
        
        ZStack {
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .onAppear(perform: classifierViewModel.loadJSON)
        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView(classifierViewModel: ClassifierViewModel()) {
            Text("Hello world!")
        }
            .environmentObject(PredictionStatus())
    }
}
