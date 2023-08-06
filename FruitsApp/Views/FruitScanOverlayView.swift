//
//  FruitScanOverlayView.swift
//  FruitsApp
//
//  Created by Erick Daniel Padilla on 05/08/23.
//

import SwiftUI

struct FruitScanOverlayView: View {
    
    let fruitFound: Fruit?
    let didTapCollection: () -> Void
    let didTapOpen: (Fruit) -> Void
    
    var hasFound: Bool {
        fruitFound != nil
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom, spacing: 0) {
                MascotScanView(hasFound: hasFound).id(hasFound)
                VStack(spacing: 16) {
                    if let fruit = fruitFound {
                        HStack(spacing: 24) {
                            Image(fruit.label)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 64)
                            Text(fruit.name)
                                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(fruit.colorValue)
                                .padding(.trailing, 32)
                        }
                        .padding(.bottom, 16)
                    } else {
                        VStack(spacing: 12) {
                            Text("I don’t see any fruits!")
                                .font(.system(.title, design: .rounded, weight: .bold))
                                .multilineTextAlignment(.center)
                            Text("Point your camera towards a fruit.")
                                .font(.system(.subheadline, design: .rounded, weight: .medium))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                        }
                        .padding(.bottom, 4)
                    }
                    HStack(spacing: 16) {
                        Button("\(Image(systemName: "list.bullet"))  My Collection", action: didTapCollection)
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.capsule)
                            .controlSize(.large)
                            .tint(.red)
                            .font(.system(.headline, design: .rounded, weight: .semibold))
                        if let fruit = fruitFound {
                            Button("\(Image(systemName: "plus"))  Add to collection", action: { didTapOpen(fruit) })
                                .buttonStyle(.bordered)
                                .buttonBorderShape(.capsule)
                                .controlSize(.large)
                                .tint(fruit.colorValue)
                                .font(.system(.headline, design: .rounded, weight: .semibold))
                        }
                    }
                }
                .padding(32)
                .frame(maxWidth: 500)
                .background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 2)
                .padding(.bottom, 90)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                self.fruitFound = .orange
//            }
//        }
    }
}

struct MascotScanView: View {
    let hasFound: Bool
    
    @State private var isAnimating = false
    
    var body: some View {
        Image(hasFound ? "SearchHappy" : "Search")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 160)
            .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 2)
            .rotationEffect(isAnimating ? .degrees(10 + angleOffset) : .degrees(-10 + angleOffset))
            .animation(.easeInOut(duration: hasFound ? 0.3 : 1).repeatForever(autoreverses: true), value: isAnimating)
            .animation(.easeInOut(duration: 0), value: hasFound)
            .padding(.vertical, 32)
            .padding(.horizontal, 16)
            .onAppear(perform: startAnimating)
    }
    
    var angleOffset: Double {
        hasFound ? 0 : 10
    }
    
    func startAnimating() {
        isAnimating = true
    }
}

struct FruitScanOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        FruitScanOverlayView(fruitFound: nil, didTapCollection: {}, didTapOpen: {_ in})
            .background {
                Image("Kitchen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
    }
}
