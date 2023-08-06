//
//  FruitFactsPageView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 06/08/23.
//

import SwiftUI
import MapKit

struct FruitFactsPageView: View {
    let fruit: Fruit
    
    var coordinateRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: .init(latitude: fruit.origin.latitude, longitude: fruit.origin.longitude),
            span: .init(latitudeDelta: fruit.origin.span, longitudeDelta: fruit.origin.span)
        )
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 48) {
                VStack(spacing: 12) {
                    Text("Fun fact")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    
                    Text(fruit.funfact)
                        .font(.system(.title3, design: .rounded, weight: .regular))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 48)
                VStack(spacing: 24) {
                    Text("Benefits")
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                    BenefitsView(benefits: fruit.benefits)
                }
                VStack(spacing: 16) {
                    HStack(alignment: .center, spacing: 48) {
                        Text("Origin")
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                            .foregroundColor(.primary)
//                        HStack(spacing: 8) {
//                            Text("Mexico")
//                                .font(.system(.largeTitle, design: .rounded, weight: .medium))
//                                .foregroundColor(fruit.season.color)
//                                .fixedSize(horizontal: true, vertical: false)
//                        }
                    }
                    Map(
                        coordinateRegion: .constant(coordinateRegion),
                        interactionModes: [],
                        showsUserLocation: false,
                        userTrackingMode: nil
//                        annotationItems: {
//                            [
//                                (id: "Mexico", coordinateRegion)
//                            ]
//                        },
//                        annotationContent: {
//                            let (name, region) = $0
//
//                        }
                    )
                    .aspectRatio(16/9, contentMode: .fit)
                    .mask({ RoundedRectangle(cornerRadius: 16, style: .continuous) })
                    .padding(.horizontal, 64)
                }
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 32)
        }
    }
}

struct BenefitsView: View {
    let benefits: [Fruit.Benefit]
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 20) {
            ForEach(benefits) { benefit in
                GridRow {
                    Image(systemName: benefit.symbol)
                        .font(.system(.title, design: .rounded, weight: .medium))
                        .foregroundColor(.accentColor)
                        .gridColumnAlignment(.center)
//                        .padding(.leading, 16)
                    Text(benefit.title)
                        .font(.system(.title, design: .rounded, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accentColor)
                        .gridColumnAlignment(.leading)
//                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding(.horizontal, 64)
    }
    
//    @State private var selectedBenefit: String? = nil
//
//    var body: some View {
//        VStack(spacing: 24) {
////        Grid(horizontalSpacing: 32, verticalSpacing: 24) {
//            ForEach(benefits) { benefit in
//                VStack(spacing: 24) {
//                    //                GridRow {
//                    Button(action: { toggle(for: benefit) }) {
//                        HStack(alignment: .center, spacing: 12) {
//                            Image(systemName: benefit.symbol)
//                                .font(.system(.title2, design: .rounded, weight: .bold))
//                            Text(benefit.title)
//                                .font(.system(.title2, design: .rounded, weight: .bold))
//                            Spacer()
//                            Image(systemName: "chevron.down")
//                                .font(.system(.title2, design: .rounded, weight: .bold))
//                        }
//                    }
//                    //                }
//                    if selectedBenefit == benefit.title {
//                        Text(benefit.description)
//                            .font(.system(.title3, design: .rounded, weight: .regular))
//                            .multilineTextAlignment(.leading)
//                            .frame(maxWidth: .infinity, alignment: .leading)
////                            .animation(.default, value: selectedBenefit)
//                            .transition(.slide)
//                    }
//
//                }
//            }
//        }
//        .padding(.horizontal, 64)
//    }
//
//    func toggle(for benefit: Fruit.Benefit) {
//        selectedBenefit = selectedBenefit == benefit.title ? nil : benefit.title
//    }
}

struct FruitFactsPageView_Previews: PreviewProvider {
    static var previews: some View {
        Image("Kitchen")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .sheet(isPresented: .constant(true)) {
                FruitInfoModalView(fruit: .grapefruit, comesFromScan: true, initialPage: 2)
            }
    }
}
